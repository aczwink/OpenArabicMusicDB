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

import { Accidental, NaturalNote, OctavePitch } from "@aczwink/openarabicmusicdb-domain/dist/OctavePitch";

export type LilyPondNoteLanguage = "english" | "italian";

function ToEnglishLilypondNote(pitch: OctavePitch)
{
    function AccidentalToString(acc: Accidental)
    {
        switch(acc)
        {
            case Accidental.DoubleFlat:
                return "ff";
            case Accidental.ThreeQuarterFlat:
                return "tqf";
            case Accidental.Flat:
                return "f";
            case Accidental.HalfFlat:
                return "qf";
            case Accidental.Natural:
                return "";
            case Accidental.HalfSharp:
                return "qs";
            case Accidental.Sharp:
                return "s";
            default:
                throw new Error("NOT IMPLEMENTED: " + acc);
        }
    }

    function NoteNameToString(note: NaturalNote)
    {
        switch(note)
        {
            case NaturalNote.A:
                return "a";
            case NaturalNote.B:
                return "b";
            case NaturalNote.C:
                return "c";
            case NaturalNote.D:
                return "d";
            case NaturalNote.E:
                return "e";
            case NaturalNote.F:
                return "f";
            case NaturalNote.G:
                return "g";
        }
    }

    return NoteNameToString(pitch.baseNote) + AccidentalToString(pitch.accidental);
}

function ToItalianLilypondNote(pitch: OctavePitch)
{
    function AccidentalToString(acc: Accidental)
    {
        switch(acc)
        {
            case Accidental.DoubleFlat:
                return "bb";
            case Accidental.ThreeQuarterFlat:
                return "bsb";
            case Accidental.Flat:
                return "b";
            case Accidental.HalfFlat:
                return "sb";
            case Accidental.Natural:
                return "";
            case Accidental.HalfSharp:
                return "sd";
            case Accidental.Sharp:
                return "d";
            default:
                throw new Error("NOT IMPLEMENTED: " + acc);
        }
    }

    function NoteNameToString(note: NaturalNote)
    {
        switch(note)
        {
            case NaturalNote.A:
                return "la";
            case NaturalNote.B:
                return "si";
            case NaturalNote.C:
                return "do";
            case NaturalNote.D:
                return "re";
            case NaturalNote.E:
                return "mi";
            case NaturalNote.F:
                return "fa";
            case NaturalNote.G:
                return "sol";
        }
    }

    return NoteNameToString(pitch.baseNote) + AccidentalToString(pitch.accidental);
}

export function ToLilypondNote(pitch: OctavePitch, language: LilyPondNoteLanguage)
{
    switch(language)
    {
        case "english":
            return ToEnglishLilypondNote(pitch);
        case "italian":
            return ToItalianLilypondNote(pitch);
    }
}