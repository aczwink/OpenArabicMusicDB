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
import { MusicEvent, MusicEventType } from "../sheet-music";
import { ToLilypondNote } from "./notes";
import { FullPitch } from "../FullPitch";
import { ComputeIntervalBetween24TET } from "../24TET";

function ComputeTranspositionDirection(sourcePitch: OctavePitch, targetPitch: OctavePitch)
{
    const s: FullPitch = { octave: 4, ...sourcePitch };
    const t1: FullPitch = { octave: 4, ...targetPitch };
    const t2: FullPitch = { octave: 5, ...targetPitch };

    const d1 = Math.abs(ComputeIntervalBetween24TET(t1, s));
    const d2 = Math.abs(ComputeIntervalBetween24TET(t2, s));

    if(d1 < d2)
        return -1;
    return 0;
}

function FindBaseKey(event: MusicEvent | MusicEvent[]): OctavePitch | undefined
{
    if(Array.isArray(event))
    {
        for (const e of event)
        {
            const base = FindBaseKey(e);
            if(base !== undefined)
                return base;
        }
        return undefined;
    }

    switch(event.type)
    {
        case MusicEventType.Repeat:
            return FindBaseKey(event.nestedEvents);
        case MusicEventType.UpdateMaqam:
            return event.pitch;
    }

    console.log(event);
    throw new Error("TODO");
}

function FindFirstNote(event: MusicEvent | MusicEvent[]): FullPitch | undefined
{
    if(Array.isArray(event))
    {
        for (const e of event)
        {
            const result = FindFirstNote(e);
            if(result !== undefined)
                return result;
        }
        return undefined;
    }

    switch(event.type)
    {
        case MusicEventType.NotesOrRests:
            return event.notesOrRests.find(x => "octave" in x);
        case MusicEventType.Repeat:
            return FindFirstNote(event.nestedEvents);
        case MusicEventType.UpdateMaqam:
        case MusicEventType.UpdateTempo:
        case MusicEventType.UpdateTimeSignature:
            break;
        default:
            console.log(event);
            throw new Error("TODO");
    }
}

function GetOctaveMarker(octave: number)
{
    switch(octave)
    {
        case 3:
            return "";
        case 4:
            return "'";
    }
    throw new Error("GetOctaveMarker" + octave);
}

export function WrapInTranspose(lilyPondCode: string, events: MusicEvent[], targetPitch: OctavePitch)
{
    const baseKey = FindBaseKey(events) ?? { accidental: Accidental.Natural, baseNote: NaturalNote.C };
    const direction = ComputeTranspositionDirection(baseKey, targetPitch);
    const first = FindFirstNote(events);
    const firstOctave = first?.octave ?? 4;

    const base = ToLilypondNote(baseKey, "english");
    const target = ToLilypondNote(targetPitch, "english");
    const octave = GetOctaveMarker(firstOctave + direction);
    return `\\transpose ${base} ${target}${octave} { ${lilyPondCode} }`;
}