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
import { Accidental, NaturalNote } from "@aczwink/openarabicmusicdb-domain/dist/OctavePitch";
import { FullPitch } from "./FullPitch";

export function AccidentalFrom24TET(_24tet: number): Accidental
{
    switch(_24tet)
    {
        case -2:
            return Accidental.Flat;
        case 0:
            return Accidental.Natural;
        case 2:
            return Accidental.Sharp;
    }
    throw new Error("AccidentalFrom24TET not implemented." + _24tet);
}

export function AccidentalTo24TET(accidental: Accidental)
{
    switch(accidental)
    {
        case Accidental.Flat:
            return -2;
        case Accidental.Natural:
            return 0;
        case Accidental.Sharp:
            return 2;
    }

    throw new Error("AccidentalTo24TET not implemented." + accidental);
}

export function ComputeIntervalBetween24TET(from: FullPitch, to: FullPitch): number
{
    function MapNaturalPitchToOctaveOffset(naturalPitch: NaturalNote)
    {
        switch(naturalPitch)
        {
            case NaturalNote.C:
                return 0;
            case NaturalNote.D:
                return 4;
            case NaturalNote.E:
                return 8;
            case NaturalNote.F:
                return 10;
            case NaturalNote.G:
                return 14;
            case NaturalNote.A:
                return 18;
            case NaturalNote.B:
                return 20;
        }
    }

    const quarterToneNumberFrom = from.octave * 24 + MapNaturalPitchToOctaveOffset(from.baseNote) + AccidentalTo24TET(from.accidental);
    const quarterToneNumberTo = to.octave * 24 + MapNaturalPitchToOctaveOffset(to.baseNote) + AccidentalTo24TET(to.accidental);

    return quarterToneNumberTo - quarterToneNumberFrom;
}