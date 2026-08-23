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
import { TimedChord } from "../model/Chord";
import { NoteOrRest } from "../model/Note";
import { ChordTypeToLilyPondString } from "./chords";
import { DurationToLilyPond } from "./duration";
import { ToLilypondNote } from "./notes";

export function GenerateCodeForChord(x: TimedChord): string
{
    return ToLilypondNote(x.root, "english") + DurationToLilyPond(x.duration) + ChordTypeToLilyPondString(x.type);
}

export function GenerateCodeForNote(note: NoteOrRest): string
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
