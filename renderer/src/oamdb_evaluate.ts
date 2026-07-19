/**
 * OpenArabicMusicDB
 * Copyright (C) 2026 Amir Czwink (amir130@hotmail.de)
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * */
import { OAMDB_RhythmDefinition, OAMDB_SheetMusic_Document, OAMDB_SheetMusic_Event, OAMDB_SheetMusic_EventType } from "@aczwink/openarabicmusicdb-domain";
import { MusicEvent, MusicEventType, PieceMetaInformation, Section, SheetMusic } from "./sheet-music";
import { Accidental, NaturalNote, OctavePitch } from "@aczwink/openarabicmusicdb-domain/dist/OctavePitch";
import "@aczwink/acts-util-core";
import { LilyPondNoteLanguage } from "./lilypond/notes";
import { FullPitch } from "./FullPitch";
import { ParseLilyPondChords, ParseLilyPondDuration, ParseLilyPondNote, ParseLilypondPitch } from "./lilypond/parsing";
import { Fraction } from "./Fraction";
import { Note, NoteOrRest } from "./model/Note";
import { ComputeIntervalBetween24TET } from "./24TET";

interface EvaluationContext
{
    chordLanguage?: LilyPondNoteLanguage;
    melodyLanguage: LilyPondNoteLanguage;
}

export interface EvaluationEnvironment
{
    lookupRhythm: (rhythmId: string) => Promise<OAMDB_RhythmDefinition>;
}

interface EvaluationState
{
    currentDuration: Fraction;
    environment: EvaluationEnvironment;
    relativePitch: FullPitch;
}

function ResolveCorrectOctave(pitch: OctavePitch, relativeNote: FullPitch)
{
    const notes: FullPitch[] = [
        {
            ...pitch,
            octave: relativeNote.octave
        },
        {
            ...pitch,
            octave: relativeNote.octave + 1
        },
        {
            ...pitch,
            octave: relativeNote.octave - 1,
        }
    ];

    let best_d = Number.MAX_SAFE_INTEGER;
    let best = notes[0]!;

    for (const octaveNote of notes)
    {
        const real_d = ComputeIntervalBetween24TET(octaveNote, relativeNote);
        const d = Math.abs(real_d);
        if(d < best_d)
        {
            best_d = d;
            best = octaveNote;
        }
    }

    return best;
}

function ParseLilyPondNotes(noteLanguage: LilyPondNoteLanguage, notes: string, state: EvaluationState)
{
    const split = notes.trim().split(/[ \n]+/);

    const result: NoteOrRest[] = [];
    for (const element of split)
    {
        switch(element)
        {
            case "|":
                continue;
        }

        const restMatch = element.match(/^r([0-9]+\.*)?$/);
        if(restMatch !== null)
        {
            result.push({
                duration: ParseLilyPondDuration(restMatch[1]!)
            });
            continue;
        }

        const parsed = ParseLilyPondNote(noteLanguage, element);
        if(parsed.duration !== undefined)
            state.currentDuration = parsed.duration;

        const resolved = ResolveCorrectOctave(parsed.pitch, state.relativePitch);
        resolved.octave += parsed.octaveDerivation;
        const createdNote: Note = {
            ...resolved,
            duration: state.currentDuration
        };
        result.push(createdNote);

        state.relativePitch = createdNote;
    }

    return result;
}

function ComputeTimeSig(rhythm: OAMDB_RhythmDefinition): Fraction
{
    if("note" in rhythm)
        return new Fraction(1, rhythm.duration);

    return rhythm.partitions.Values().Map(x => ComputeTimeSig(x)).Accumulate( (a, b) => a.Add(b));
}

async function QueryRhythmTimeSig(rhythmId: string, environment: EvaluationEnvironment)
{
    const rhythm = await environment.lookupRhythm(rhythmId);
    if(rhythm === undefined)
        throw new Error("Rhythm has no definition: " + rhythmId);

    const result = ComputeTimeSig(rhythm);

    return result;
}

async function EvaluateEvent(event: OAMDB_SheetMusic_Event, context: EvaluationContext, state: EvaluationState): Promise<MusicEvent | undefined>
{
    switch(event.type)
    {
        case OAMDB_SheetMusic_EventType.LilyPondMusic:
            {
                const parsed = ParseLilyPondNotes(context.melodyLanguage, event.notes, state);

                if(event.chords !== undefined)
                {
                    if(context.chordLanguage === undefined)
                        throw new Error("No chord language is defined!");

                    return {
                        type: MusicEventType.NotesOrRests,
                        chords: ParseLilyPondChords(event.chords, context.chordLanguage),
                        notesOrRests: parsed
                    };
                }

                return {
                    type: MusicEventType.NotesOrRests,
                    notesOrRests: parsed
                };
            }

        case OAMDB_SheetMusic_EventType.Repeat:
            return {
                type: MusicEventType.Repeat,
                nestedEvents: await EvaluateEvents(event.music, context, state)
            };

        case OAMDB_SheetMusic_EventType.UpdateMaqam:
            return {
                type: MusicEventType.UpdateMaqam,
                pitch: ParseLilypondPitch(event.octavePitch, "english"),
                maqamId: event.maqamId
            };

        case OAMDB_SheetMusic_EventType.UpdateRelativePitch:
            {
                const pitch = ParseLilypondPitch(event.pitch.substring(0, event.pitch.length - 1), "english");
                state.relativePitch = {
                    accidental: pitch.accidental,
                    baseNote: pitch.baseNote,
                    octave: parseInt(event.pitch[event.pitch.length - 1]!)
                };
            }
            return undefined;

        case OAMDB_SheetMusic_EventType.UpdateRhythm:
            const timeSig = await QueryRhythmTimeSig(event.rhythmId, state.environment);
            return {
                type: MusicEventType.UpdateTimeSignature,
                num: timeSig.num,
                den: timeSig.den
            };

        case OAMDB_SheetMusic_EventType.UpdateTempo:
            return {
                type: MusicEventType.UpdateTempo,
                tempo: event.tempo,
                duration: ParseLilyPondDuration(event.durationValue),
            };

        case OAMDB_SheetMusic_EventType.UpdateTimeSignature:
            return {
                type: MusicEventType.UpdateTimeSignature,
                num: event.numerator,
                den: event.denominator
            };
    }
}

async function EvaluateEvents(events: OAMDB_SheetMusic_Event[], context: EvaluationContext, state: EvaluationState)
{
    const parts = await events.Values().Map(x => EvaluateEvent(x, context, state)).Async().NotUndefined().ToArray();
    return parts;
}

async function EvaluateSections(sheetMusic: OAMDB_SheetMusic_Document, state: EvaluationState)
{
    const result: Section[] = [];
    for (const section of sheetMusic.sections)
    {
        result.push({
            events: await EvaluateEvents(section.events, section, state)
        });
    }

    return result;
}

export async function EvaluateSheetMusic(sheetMusic: OAMDB_SheetMusic_Document, meta: PieceMetaInformation, environment: EvaluationEnvironment): Promise<SheetMusic>
{
    const state: EvaluationState = {
        currentDuration: new Fraction(1, 4),
        environment,
        relativePitch: {
            accidental: Accidental.Natural,
            baseNote: NaturalNote.C,
            octave: 4
        }
    };

    return {
        layout: sheetMusic.layout,
        meta,
        sections: await EvaluateSections(sheetMusic, state),
        sectionSequence: sheetMusic.sectionsSequence,
    };
}