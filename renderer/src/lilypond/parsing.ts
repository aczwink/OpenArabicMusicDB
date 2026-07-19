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
import { LilyPondNoteLanguage } from "./notes";
import { Fraction } from "../Fraction";
import { ChordType, TimedChord } from "../model/Chord";

export function ParseLilyPondDuration(dur: string): Fraction
{
    if(dur.endsWith("."))
    {
        const den = parseInt(dur.substring(0, dur.length - 1));
        return new Fraction(1, den).Add(new Fraction(1, den * 2));
    }
    return new Fraction(1, parseInt(dur));
}

function ParseEnglishPitch(pitch: string): OctavePitch
{
    let base;
    switch(pitch.charAt(0))
    {
        case "a":
            base = NaturalNote.A;
            break;
        case "b":
            base = NaturalNote.B;
            break;
        case "c":
            base = NaturalNote.C;
            break;
        case "d":
            base = NaturalNote.D;
            break;
        case "f":
            base = NaturalNote.F;
            break;
        case "g":
            base = NaturalNote.G;
            break;
        default:
            throw new Error("Illegal english LilyPond pitch: " + pitch);
    }

    let acc;
    switch(pitch.substring(1))
    {
        case "":
            acc = Accidental.Natural;
            break;
        case "f":
            acc = Accidental.Flat;
            break;
        default:
            throw new Error("Illegal english LilyPond pitch: " + pitch);
    }

    return {
        accidental: acc,
        baseNote: base
    };
}

function ParseItalianPitch(pitch: string): OctavePitch
{
    function ParseAccidental(remainder: string)
    {
        switch(remainder)
        {
            case "":
                return Accidental.Natural;
            case "b":
                return Accidental.Flat;
            case "d":
                return Accidental.Sharp;
            default:
                throw new Error("Illegal italian LilyPond accidental: " + remainder);
        }
    }

    let base;

    if(pitch.substring(0, 3) === "sol")
        base = NaturalNote.G;
    else
    {
        const pitch2 = pitch.substring(0, 2);
        switch(pitch2)
        {
            case "do":
                base = NaturalNote.C;
                break;
            case "re":
                base = NaturalNote.D;
                break;
            case "mi":
                base = NaturalNote.E;
                break;
            case "fa":
                base = NaturalNote.F;
                break;
            case "la":
                base = NaturalNote.A;
                break;
            case "si":
                base = NaturalNote.B;
                break;
            default:
                throw new Error("Illegal italian LilyPond pitch: " + pitch);
        }
    }
    
    return {
        accidental: ParseAccidental( (base === NaturalNote.G) ? pitch.substring(3) : pitch.substring(2) ),
        baseNote: base
    };
}

function ParseLilyPondChordType(text?: string)
{
    switch(text)
    {
        case undefined:
            return ChordType.MajorTriad;
        case "5.8":
            return ChordType.PowerChord;
        case "min":
            return ChordType.MinorTriad;
    }

    throw new Error("ParseLilyPondChordType: " + text);
}

export function ParseLilyPondChords(notes: string, noteLanguage: LilyPondNoteLanguage)
{
    const split = notes.trim().split(/[ \n]+/);

    const result: TimedChord[] = [];
    let currentDuration = new Fraction(1, 4);
    for (const element of split)
    {
        const parts = element.split(":");

        const parsed = ParseLilyPondNote(noteLanguage, parts[0]!);
        if(parsed.duration !== undefined)
            currentDuration = parsed.duration;

        const createdChord: TimedChord = {
            root: parsed.pitch,
            type: ParseLilyPondChordType(parts[1]),
            duration: currentDuration
        };
        result.push(createdChord);
    }

    return result;
}

export function ParseLilyPondNote(noteLanguage: LilyPondNoteLanguage, note: string)
{
    function ParseOctaveDelta(octavePart: string)
    {
        let delta = 0;

        for (const c of octavePart)
        {
            switch(c)
            {
                case ",":
                    delta--;
                    break;
                case "'":
                    delta++;
                    break;
            }
        }

        return delta;
    }

    const match = note.match(/([a-z]+)([,']+)?([0-9]+\.*)?$/);
    if(match === null)
        throw new Error("Couldn't parse note: " + note);

    const pitchPart = match[1];
    const octavePart = match[2] as string | undefined;
    const durationPart = match[3] as string | undefined;

    return {
        pitch: ParseLilypondPitch(pitchPart!, noteLanguage),
        duration: (durationPart === undefined) ? undefined : ParseLilyPondDuration(durationPart),
        octaveDerivation: (octavePart === undefined) ? 0 : ParseOctaveDelta(octavePart)
    };
}

export function ParseLilypondPitch(pitch: string, noteLanguage: LilyPondNoteLanguage): OctavePitch
{
    switch(noteLanguage)
    {
        case "english":
            return ParseEnglishPitch(pitch);
        case "italian":
            return ParseItalianPitch(pitch);
    }
}