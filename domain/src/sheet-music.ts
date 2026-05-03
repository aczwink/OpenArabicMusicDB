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

export enum OAMDB_SheetMusic_MelodyEntryType
{
    LilyPondMusic,
    Maqam,
    Rhythm,
}

export interface OAMDB_SheetMusic_LilyPondMusic
{
    type: OAMDB_SheetMusic_MelodyEntryType.LilyPondMusic;
    noteLanguage: "english" | "italian";
    notes: string;
}

export interface OAMDB_SheetMusic_MaqamEntry
{
    type: OAMDB_SheetMusic_MelodyEntryType.Maqam;
    maqamId: string;
    pitch: string;
}

export interface OAMDB_SheetMusic_RhythmEntry
{
    type: OAMDB_SheetMusic_MelodyEntryType.Rhythm;
    rhythmId: string;
}

export type OAMDB_SheetMusic_MelodyEntry = OAMDB_SheetMusic_LilyPondMusic | OAMDB_SheetMusic_MaqamEntry | OAMDB_SheetMusic_RhythmEntry;
export type OAMDB_SheetMusic_MusicEntry = OAMDB_SheetMusic_LilyPondMusic;

export interface OAMDB_SheetMusic_Section
{
    chords: OAMDB_SheetMusic_MusicEntry[];
    melody: OAMDB_SheetMusic_MelodyEntry[];
    name: string;
}

export interface OAMDB_SheetMusic_Document
{
    sections: OAMDB_SheetMusic_Section[];
    sectionsSequence: string[];
}