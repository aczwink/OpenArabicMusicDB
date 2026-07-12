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

export enum OAMDB_SheetMusic_EventType
{
    LilyPondMusic,
    Repeat,
    UpdateMaqam,
    UpdateRhythm,
    UpdateRelativePitch,
    UpdateTempo,
    UpdateTimeSignature,
}

export interface OAMDB_SheetMusic_LilyPondMusic
{
    type: OAMDB_SheetMusic_EventType.LilyPondMusic;
    chords?: string;
    notes: string;
}

export interface OAMDB_SheetMusic_RepeatEvent
{
    type: OAMDB_SheetMusic_EventType.Repeat;
    music: OAMDB_SheetMusic_Event[];
}

export interface OAMDB_SheetMusic_UpdateMaqamEvent
{
    type: OAMDB_SheetMusic_EventType.UpdateMaqam;
    maqamId: string;
    octavePitch: string;
}

export interface OAMDB_SheetMusic_UpdateRelativePitchEvent
{
    type: OAMDB_SheetMusic_EventType.UpdateRelativePitch;
    pitch: string;
}

export interface OAMDB_SheetMusic_UpdateRhythmEvent
{
    type: OAMDB_SheetMusic_EventType.UpdateRhythm;
    rhythmId: string;
}

export interface OAMDB_SheetMusic_UpdateTempoEvent
{
    type: OAMDB_SheetMusic_EventType.UpdateTempo;
    durationValue: string;
    tempo: number;
}

export interface OAMDB_SheetMusic_UpdateTimeSignatureEvent
{
    type: OAMDB_SheetMusic_EventType.UpdateTimeSignature;
    numerator: number;
    denominator: number;
}

export type OAMDB_SheetMusic_Event = OAMDB_SheetMusic_LilyPondMusic | OAMDB_SheetMusic_UpdateMaqamEvent | OAMDB_SheetMusic_RepeatEvent | OAMDB_SheetMusic_UpdateRhythmEvent | OAMDB_SheetMusic_UpdateRelativePitchEvent | OAMDB_SheetMusic_UpdateTempoEvent | OAMDB_SheetMusic_UpdateTimeSignatureEvent;

export interface OAMDB_SheetMusic_Section
{
    chordLanguage?: "english" | "italian";
    melodyLanguage: "english" | "italian";
    events: OAMDB_SheetMusic_Event[];
}

export interface OAMDB_SheetMusic_LayoutInfo
{
    globalStaffSize: number;
    includeLyrics: boolean;
    useTwoColumnsForLyrics: boolean;
}

export interface OAMDB_SheetMusic_Document
{
    layout: OAMDB_SheetMusic_LayoutInfo;
    sections: OAMDB_SheetMusic_Section[];
    sectionsSequence: number[];
}