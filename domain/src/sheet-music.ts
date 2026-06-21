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
    Repeat,
    UpdateMaqam,
    UpdateRhythm,
    UpdateRelativePitch,
    UpdateTimeSignature,
}

export interface OAMDB_SheetMusic_LilyPondMusic
{
    type: OAMDB_SheetMusic_MelodyEntryType.LilyPondMusic;
    noteLanguage: "english" | "italian";
    notes: string;
}

export interface OAMDB_SheetMusic_RepeatEntry
{
    type: OAMDB_SheetMusic_MelodyEntryType.Repeat;
    music: OAMDB_SheetMusic_MelodyEvent[];
}

export interface OAMDB_SheetMusic_UpdateMaqamEvent
{
    type: OAMDB_SheetMusic_MelodyEntryType.UpdateMaqam;
    maqamId: string;
    octavePitch: string;
}

export interface OAMDB_SheetMusic_UpdateRelativePitchEvent
{
    type: OAMDB_SheetMusic_MelodyEntryType.UpdateRelativePitch;
    pitch: string;
}

export interface OAMDB_SheetMusic_UpdateRhythmEvent
{
    type: OAMDB_SheetMusic_MelodyEntryType.UpdateRhythm;
    rhythmId: string;
}

export interface OAMDB_SheetMusic_UpdateTimeSignatureEvent
{
    type: OAMDB_SheetMusic_MelodyEntryType.UpdateTimeSignature;
    numerator: number;
    denominator: number;
}

export type OAMDB_SheetMusic_MelodyEvent = OAMDB_SheetMusic_LilyPondMusic | OAMDB_SheetMusic_UpdateMaqamEvent | OAMDB_SheetMusic_RepeatEntry | OAMDB_SheetMusic_UpdateRhythmEvent | OAMDB_SheetMusic_UpdateRelativePitchEvent | OAMDB_SheetMusic_UpdateTimeSignatureEvent;
export type OAMDB_SheetMusic_MusicEntry = OAMDB_SheetMusic_LilyPondMusic;

export interface OAMDB_SheetMusic_Section
{
    chords: OAMDB_SheetMusic_MusicEntry[];
    melody: OAMDB_SheetMusic_MelodyEvent[];
}

export interface OAMDB_SheetMusic_Document
{
    sections: OAMDB_SheetMusic_Section[];
    sectionsSequence: number[];
}