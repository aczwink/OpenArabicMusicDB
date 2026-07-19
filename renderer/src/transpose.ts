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
/*
import { NaturalNote, OctavePitch } from "@aczwink/openarabicmusicdb-domain/dist/OctavePitch";
import { MusicEvent, MusicEventType, SingleSectionSheetMusic } from "./sheet-music";
import { NoteOrRest } from "./model/Note";
import { FullPitch } from "./FullPitch";
import { AccidentalFrom24TET, AccidentalTo24TET } from "./24TET";
import { TimedChord } from "./Chord";

interface PitchMap
{
    sourcePitch: OctavePitch;
    targetPitch: OctavePitch;
}

interface TranspositionState
{
    pitchMap: PitchMap[];
    sourceKey: OctavePitch
    targetKey: OctavePitch;
}

async function BuildMapping(maqamId: string, state: TranspositionState)
{
    const maqamDetails = await this.maqamatController.QueryMaqamInfo(maqamId);
    if(maqamDetails === undefined)
        throw new Error("1");

    const maqamIntervals = await this.intervalsService.QueryMaqamIntervals(maqamId, maqamDetails.branchingJinsIds[0]);
    if(maqamIntervals === undefined)
        throw new Error("2");
    const sourcePitches = this.intervalsService.ResolveScalePitches(state.sourceKey, maqamIntervals);
    const targetPitches = this.intervalsService.ResolveScalePitches(state.targetKey, maqamIntervals);

    const pitchMap: PitchMap[] = [];
    for(let i = 0; i < sourcePitches.length; i++)
    {
        pitchMap.push({
            sourcePitch: sourcePitches[i],
            targetPitch: targetPitches[i]
        });
    }
    state.pitchMap = pitchMap;
}

function TransposeChord(state: TranspositionState, chord: TimedChord): TimedChord
{
    return {
        duration: chord.duration,
        root: TransposePitch({ octave: 4, ...chord.root }, state),
        type: chord.type
    };
}

function TransposeChords(chords: TimedChord[], state: TranspositionState)
{
    const mapped = [];
    for (const chord of chords)
    {
        mapped.push(TransposeChord(state, chord));
    }

    return mapped;
}

function TransposeChromatic(pitch: FullPitch, state: TranspositionState)
{
    const map = state.pitchMap.find(x => x.sourcePitch.baseNote === pitch.baseNote);
    if(map === undefined)
        throw new Error("3");

    const derivation = AccidentalTo24TET(pitch.accidental) - AccidentalTo24TET(map.sourcePitch.accidental);
    const mapped = AccidentalTo24TET(map.targetPitch.accidental) + derivation;

    return AccidentalFrom24TET(mapped);
}

function TransposeDiatonic(basePitch: NaturalNote, octave: number, diatonicSteps: number)
{
    if(diatonicSteps >= 0)
    {
        while(diatonicSteps--)
        {
            switch(basePitch)
            {
                case NaturalNote.B:
                    basePitch++;
                    octave++;
                    break;
                case NaturalNote.G:
                    basePitch = NaturalNote.A;
                    break;
                default:
                    basePitch++;
                    break;
            }
        }
    }
    else
    {
        throw new Error("transpose down not implemented yet");
    }

    return {
        basePitch,
        octave
    };
}

function TransposePitch(pitch: FullPitch, state: TranspositionState): FullPitch
{
    const diatonicSteps = state.targetKey.baseNote - state.sourceKey.baseNote;

    const chromaticTransposition = TransposeChromatic(pitch, state);
    const diatonicTransposed = TransposeDiatonic(pitch.baseNote, pitch.octave, diatonicSteps);

    return {
        accidental: chromaticTransposition,
        baseNote: diatonicTransposed.basePitch,
        octave: diatonicTransposed.octave
    };
}

function TransposeNoteOrRest(state: TranspositionState, noteOrRest: NoteOrRest): NoteOrRest
{
    if("octave" in noteOrRest)
    {
        const transposed = TransposePitch(noteOrRest, state);

        return {
            accidental: transposed.accidental,
            baseNote: transposed.baseNote,
            duration: noteOrRest.duration,
            octave: transposed.octave
        };
    }

    return noteOrRest;
}

async function TransposeEvent(state: TranspositionState, event: MusicEvent): Promise<MusicEvent>
{
    switch(event.type)
    {
        case MusicEventType.NotesOrRests:
            if(event.chords === undefined)
            {
                return {
                    type: MusicEventType.NotesOrRests,
                    notesOrRests: event.notesOrRests.map(TransposeNoteOrRest.bind(null, state))
                };
            }
            
            return {
                type: MusicEventType.NotesOrRests,
                chords: TransposeChords(event.chords, state),
                notesOrRests: event.notesOrRests.map(TransposeNoteOrRest.bind(null, state))
            };

        case MusicEventType.Repeat:
            return {
                type: MusicEventType.Repeat,
                nestedEvents: await TransposeEvents(event.nestedEvents, state)
            };

        case MusicEventType.UpdateMaqam:
            state.sourceKey = event.pitch;
            await BuildMapping(event.maqamId, state);
            return {
                type: MusicEventType.UpdateMaqam,
                maqamId: event.maqamId,
                pitch: state.targetKey
            };
    }

    return event;
}

async function TransposeEvents(events: MusicEvent[], state: TranspositionState)
{
    const mapped = [];
    for (const event of events)
    {
        mapped.push(await TransposeEvent(state, event));
    }

    return mapped;
}

export async function TransposeTo(data: SingleSectionSheetMusic, targetKey: OctavePitch): Promise<SingleSectionSheetMusic>
{
    const state = {
        pitchMap: [],
        sourceKey: targetKey,
        targetKey
    };

    const events = await TransposeEvents(data.events, state);
    return {
        events,
        layout: data.layout,
        meta: data.meta,
    };
}*/