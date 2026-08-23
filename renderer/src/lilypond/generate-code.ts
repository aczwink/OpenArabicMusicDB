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
import { OctavePitch } from "@aczwink/openarabicmusicdb-domain/dist/OctavePitch";
import { MusicEvent, SingleSectionSheetMusic } from "../sheet-music";
import { ComputeDurationOfEvents } from "./duration";
import { ProcessEventsAndGenCode } from "./events-processing";
import { GenerateLilyPondLyricsCode } from "./lyrics";
import { GenerateCodeForChord, GenerateCodeForNote } from "./notes-to-string";
import { CreateRests } from "./rest-filling";
import { WrapInTranspose } from "./transposition";

interface RealizationOptions
{
    fullAccompaniment: boolean;
    unfoldRepeats: boolean;
}

async function GenerateAccompanimentCode(data: SingleSectionSheetMusic, targetPitch: OctavePitch, state: RealizationOptions)
{
    if(state.fullAccompaniment)
    {
        //TODO :-)
    }

    const chords = await GenerateChordModeCode(data.events, targetPitch, state);

    return {
        staff: `\\chordmode { \\set chordChanges = ##t ${chords} }`,
        staffType: "ChordNames",
    };
}

async function GenerateChordModeCode(events: MusicEvent[], targetPitch: OctavePitch, state: RealizationOptions): Promise<string>
{
    const code = await ProcessEventsAndGenCode(events, {
        options: state,

        RenderNotes: event => {
            if(event.chords === undefined)
            {
                const duration = ComputeDurationOfEvents([event]);
                return CreateRests(duration);
            }
            return event.chords.map(GenerateCodeForChord).join(" ");
        },
    });
    return WrapInTranspose(code, events, targetPitch);
}

async function GenerateMelodyCode(events: MusicEvent[], targetPitch: OctavePitch, state: RealizationOptions)
{
    const code = await ProcessEventsAndGenCode(events, {
        options: state,

        RenderNotes: event => event.notesOrRests.map(GenerateCodeForNote).join(" ")
    });
    return WrapInTranspose(code, events, targetPitch);
}

function GenerateTagLine()
{
    const year = new Date().getFullYear();
    return `\\markup { \\abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025-${year} Amir Czwink" }`;
}

export async function GenerateLilyPondCodeFromSheetMusic(data: SingleSectionSheetMusic, targetPitch: OctavePitch, state: RealizationOptions)
{
    const fontSize = data.layout.globalStaffSize;

    const acc = await GenerateAccompanimentCode(data, targetPitch, state);
    const melody = await GenerateMelodyCode(data.events, targetPitch, state);

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