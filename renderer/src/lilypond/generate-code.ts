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
import { Fraction } from "../Fraction";
import { NoteOrRest } from "../model/Note";
import { MusicEvent, MusicEventType, RepeatEvent, SingleSectionSheetMusic } from "../sheet-music";
import { ChordTypeToLilyPondString } from "./chords";
import { GenerateLilyPondLyricsCode } from "./lyrics";
import { ToLilypondNote } from "./notes";

interface RealizationOptions
{
    fullAccompaniment: boolean;
    unfoldRepeats: boolean;
}

function DurationToLilyPond(duration: Fraction)
{
    switch(duration.num)
    {
        case 1:
            return duration.den;
        case 3:
            return (duration.den / 2) + ".";
    }

    throw new Error("Illegal duration value: " + duration.ToString());
}

async function GenerateAccompanimentCode(data: SingleSectionSheetMusic, state: RealizationOptions)
{
    if(state.fullAccompaniment)
    {
        //TODO :-)
    }

    const chords = await GenerateChordModeCode(data.events, state);

    return {
        staff: `\\chordmode { \\set chordChanges = ##t ${chords} }`,
        staffType: "ChordNames",
    };
}

async function GenerateChordModeCode(event: MusicEvent | MusicEvent[], state: RealizationOptions): Promise<string>
{
    if(Array.isArray(event))
    {
        const parts = await event.Values().Map(x => GenerateChordModeCode(x, state)).Async().ToArray();
        return parts.join("\n");
    }

    switch(event?.type)
    {
        case MusicEventType.NotesOrRests:
            if(event.chords !== undefined)
                return event.chords.map(x => ToLilypondNote(x.root, "english") + DurationToLilyPond(x.duration) + ChordTypeToLilyPondString(x.type)).join(" ");
            break;
        case MusicEventType.Repeat:
            return GenerateChordModeCode(event.nestedEvents, state);
        case MusicEventType.SegnoRepeat:
        {
            const repeated = await GenerateChordModeCode(event.repeatedEvents, state);
            const following = await GenerateChordModeCode(event.followingEvents, state);

            if(!event.fineAfterRepeat)
                throw new Error("not implemented"); //need example

            return `\\repeat segno 2 { ${repeated} \\volta 2 \\fine \\volta 1 ${following} }`;
        }
    }

    return "";
}

function GenerateCodeForNote(note: NoteOrRest): string
{
    function Times(char: string, count: number)
    {
        let result = "";
        while(count--)
            result += char;

        return result;
    }
    function OctaveToString(octave: number)
    {
        const d = octave - 3; //3 is default octave in lilypond absolute mode
        if(d > 0)
            return Times("'", d);
        return Times(",", Math.abs(d));
    }

    if("octave" in note)
    {
        return ToLilypondNote(note, "english") + OctaveToString(note.octave) + DurationToLilyPond(note.duration);
    }

    return "r" + DurationToLilyPond(note.duration);
}

function ComputeDurationOfEvent(event: MusicEvent): Fraction
{
    switch(event.type)
    {
        case MusicEventType.NotesOrRests:
            return event.notesOrRests.Values().Map(x => x.duration).Accumulate( (a, b) => a.Add(b) );
        case MusicEventType.Repeat:
            const inner = ComputeDurationOfEvents(event.nestedEvents);
            return inner.Scale(2);
    }

    return new Fraction(0, 1);
}

function ComputeDurationOfEvents(events: MusicEvent[])
{
    return events.Values().Map(ComputeDurationOfEvent).Accumulate( (a, b) => a.Add(b) );
}

async function GenerateCodeForRepeat(event: RepeatEvent, state: RealizationOptions)
{
    const nested = await GenerateMelodyCode(event.nestedEvents, state);

    let repeatType = "volta";

    if(state.unfoldRepeats)
        repeatType = "unfold";
    else
    {
        const duration = ComputeDurationOfEvents(event.nestedEvents);
        if(duration.Eval() === 1)
            repeatType = "percent";
    }

    return `\\repeat ${repeatType} 2 { ${nested} }`;
}

function MapMaqamId(maqamId: string)
{
    switch(maqamId)
    {
        case "kurdi":
            return "\\kurd";
        default:
            throw new Error("Can't map maqam: " + maqamId);
    }
}

export async function GenerateMelodyCode(event: MusicEvent | MusicEvent[], state: RealizationOptions): Promise<string>
{
    if(Array.isArray(event))
    {
        const parts = await event.Values().Map(x => GenerateMelodyCode(x, state)).PromiseAll();
        return parts.join("\n");
    }

    switch(event.type)
    {
        case MusicEventType.NotesOrRests:
            return event.notesOrRests.map(x => GenerateCodeForNote(x)).join(" ");
        case MusicEventType.Repeat:
            return GenerateCodeForRepeat(event, state);
        case MusicEventType.SegnoRepeat:
        {
            const repeated = await GenerateMelodyCode(event.repeatedEvents, state);
            const following = await GenerateMelodyCode(event.followingEvents, state);

            if(!event.fineAfterRepeat)
                throw new Error("not implemented"); //need example

            return `\\repeat segno 2 { ${repeated} \\volta 2 \\fine \\volta 1 ${following} }`;
        }
        case MusicEventType.UpdateMaqam:
            const keyPitch = ToLilypondNote(event.pitch, "english");
            return `\\key ` + keyPitch + " " + MapMaqamId(event.maqamId);

        case MusicEventType.UpdateTempo:
            return "\\tempo " + DurationToLilyPond(event.duration) + " = " + event.tempo

        case MusicEventType.UpdateTimeSignature:
            return `\\time ${event.num}/${event.den}`;
    }
}

function GenerateTagLine()
{
    const year = new Date().getFullYear();
    return `\\markup { \\abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025-${year} Amir Czwink" }`;
}

export async function GenerateLilyPondCodeFromSheetMusic(data: SingleSectionSheetMusic, state: RealizationOptions)
{
    const fontSize = data.layout.globalStaffSize;

    const acc = await GenerateAccompanimentCode(data, state);
    const melody = await GenerateMelodyCode(data.events, state);

    const lyricsCode = data.layout.includeLyrics ? GenerateLilyPondLyricsCode(data.meta.lyrics, data.layout.useTwoColumnsForLyrics) : "";

    return `
\\version "2.24.4"
\\include "arabic.ly"

\\paper
{
myStaffSize = #20
#(define fonts
    (make-pango-font-tree "Noto Naskh Arabic"
                        "Noto Sans Arabic"
                        "Noto Kufi Arabic"
                            (/ myStaffSize 20)))
}

#(set-global-staff-size ${fontSize})


\\markup naskh_bold = \\markup \\override #'((font-name . "Noto Naskh Arabic Bold") (font-size . 6)) \\etc
\\markup naskh_composer = \\markup \\override #'((font-name . "Noto Naskh Arabic") (font-size . 0.5)) \\etc

\\pointAndClickOff

\\header
{
title = \\markup \\naskh_bold "${data.meta.title}"
composer = \\markup \\naskh_composer "${data.meta.composerName}"
tagline = ${GenerateTagLine()}
}

\\language "english"
accStaff = ${acc.staff}
melody = { ${melody} }

\\score {
<<
\\new ${acc.staffType} \\accStaff
\\new Staff \\melody
>>
\\layout { }
\\midi { }
}

${lyricsCode}
`;
}