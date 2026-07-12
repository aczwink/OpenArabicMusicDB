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

import { OAMDB_SheetMusic_Document, OAMDB_SheetMusic_LayoutInfo, OAMDB_SheetMusic_MelodyEntryType, OAMDB_SheetMusic_MelodyEvent, OAMDB_SheetMusic_Section } from "@aczwink/openarabicmusicdb-domain";

interface LilypondDefinition
{
    noteLanguage: "english" | "italian";
    notes: string;
}

interface MaqamDefinition
{
    maqam: string;
    pitch: string;
}

interface RelativePitchDefinition
{
    relativePitch: string;
}

interface RepeatDefinition
{
    repeat: EventDefinition | EventDefinition[];
}

interface RhythmDefinition
{
    rhythm: string;
}

interface TempoDefinition
{
    durationValue: string;
    tempo: number;
}

interface TimeSignatureDefinition
{
    timeSignature: string;
}

type EventDefinition = LilypondDefinition | MaqamDefinition | RelativePitchDefinition | RepeatDefinition | RhythmDefinition | TempoDefinition | TimeSignatureDefinition;

interface SectionDefinition
{
    chordLanguage?: "english" | "italian";
    events: EventDefinition[];
    melodyLanguage: "english" | "italian";
    name: string;
}

interface SheetMusicDefiniton
{
    layout: OAMDB_SheetMusic_LayoutInfo;
    sections: SectionDefinition[];
    sectionsSequence: string[];
}

function ParseEventDefinition(def: EventDefinition): OAMDB_SheetMusic_MelodyEvent
{
    if("notes" in def)
    {
        return {
            type: OAMDB_SheetMusic_MelodyEntryType.LilyPondMusic,
            noteLanguage: def.noteLanguage,
            notes: def.notes
        };
    }
    else if("maqam" in def)
    {
        return {
            type: OAMDB_SheetMusic_MelodyEntryType.UpdateMaqam,
            maqamId: def.maqam,
            octavePitch: def.pitch
        };
    }
    else if("relativePitch" in def)
    {
        return {
            type: OAMDB_SheetMusic_MelodyEntryType.UpdateRelativePitch,
            pitch: def.relativePitch
        };
    }
    else if("repeat" in def)
    {
        return {
            type: OAMDB_SheetMusic_MelodyEntryType.Repeat,
            music: Array.isArray(def.repeat) ? def.repeat.map(ParseEventDefinition) : [ParseEventDefinition(def.repeat)]
        };
    }
    else if("rhythm" in def)
    {
        return {
            type: OAMDB_SheetMusic_MelodyEntryType.UpdateRhythm,
            rhythmId: def.rhythm
        };
    }
    else if("tempo" in def)
    {
        return {
            type: OAMDB_SheetMusic_MelodyEntryType.UpdateTempo,
            durationValue: def.durationValue,
            tempo: def.tempo
        };
    }
    else
    {
        const parts = def.timeSignature.split("/").map(x => parseInt(x));
        return {
            type: OAMDB_SheetMusic_MelodyEntryType.UpdateTimeSignature,
            denominator: parts[1],
            numerator: parts[0]
        };
    }
}

function ParseSection(def: SectionDefinition): OAMDB_SheetMusic_Section
{
    return {
        chords: [
            {
                noteLanguage: def.chords.noteLanguage,
                notes: def.chords.notes,
                type: OAMDB_SheetMusic_MelodyEntryType.LilyPondMusic
            }
        ],
        melody: def.melody.map(ParseEventDefinition)
    };
}

export function ParseSheetMusic(def?: SheetMusicDefiniton): OAMDB_SheetMusic_Document | undefined
{
    if(def === undefined)
        return undefined;

    return {
        layout: def.layout,
        sections: def.sections.map(ParseSection),
        sectionsSequence: def.sectionsSequence.map( x => def.sections.findIndex(y => y.name === x) )
    };
}