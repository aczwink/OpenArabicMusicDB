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

import { OAMDB_SheetMusic_Document, OAMDB_SheetMusic_MelodyEntry, OAMDB_SheetMusic_MelodyEntryType, OAMDB_SheetMusic_Section } from "@aczwink/openarabicmusicdb-domain";

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

interface RhythmDefinition
{
    rhythm: string;
}

type MelodyDefinition = LilypondDefinition | MaqamDefinition | RhythmDefinition;

interface SectionDefinition
{
    chords: LilypondDefinition[];
    melody: MelodyDefinition[];
    name: string;
}

interface SheetMusicDefiniton
{
    sections: SectionDefinition[];
    sectionsSequence: string[];
}

function ParseMelodyDefinition(def: MelodyDefinition): OAMDB_SheetMusic_MelodyEntry
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
            type: OAMDB_SheetMusic_MelodyEntryType.Maqam,
            maqamId: def.maqam,
            pitch: def.pitch
        };
    }
    else
    {
        return {
            type: OAMDB_SheetMusic_MelodyEntryType.Rhythm,
            rhythmId: def.rhythm
        };
    }
}

function ParseSection(def: SectionDefinition): OAMDB_SheetMusic_Section
{
    return {
        chords: def.chords.map(x => ({ noteLanguage: x.noteLanguage, notes: x.notes, type: OAMDB_SheetMusic_MelodyEntryType.LilyPondMusic })),
        melody: def.melody.map(ParseMelodyDefinition),
        name: def.name
    };
}

export function ParseSheetMusic(def?: SheetMusicDefiniton): OAMDB_SheetMusic_Document | undefined
{
    if(def === undefined)
        return undefined;

    return {
        sections: def.sections.map(ParseSection),
        sectionsSequence: def.sectionsSequence
    }
}