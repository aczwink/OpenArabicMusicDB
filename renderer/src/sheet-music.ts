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

import { OAMDB_SheetMusic_LayoutInfo } from "@aczwink/openarabicmusicdb-domain";
import { OctavePitch } from "@aczwink/openarabicmusicdb-domain/dist/OctavePitch";
import { Fraction } from "./Fraction";
import { NoteOrRest } from "./model/Note";
import { TimedChord } from "./model/Chord";

export enum MusicEventType
{
    NotesOrRests,
    Repeat,
    SegnoRepeat,
    UpdateMaqam,
    UpdateTempo,
    UpdateTimeSignature,
}

export interface NotesOrRestsEvent
{
    type: MusicEventType.NotesOrRests;
    chords?: TimedChord[];
    notesOrRests: NoteOrRest[];
}

export interface RepeatEvent
{
    type: MusicEventType.Repeat;
    nestedEvents: MusicEvent[];
}

export interface SegnoRepeatEvent
{
    type: MusicEventType.SegnoRepeat;
    fineAfterRepeat: boolean;
    followingEvents: MusicEvent[];
    repeatedEvents: MusicEvent[];
}

export interface UpdateMaqamEvent
{
    type: MusicEventType.UpdateMaqam;
    pitch: OctavePitch;
    maqamId: string;
}

export interface UpdateTempoEvent
{
    type: MusicEventType.UpdateTempo;
    tempo: number;
    duration: Fraction;
}

export interface UpdateTimeSignatureEvent
{
    type: MusicEventType.UpdateTimeSignature;
    num: number;
    den: number;
}

export type MusicEvent = NotesOrRestsEvent | RepeatEvent | SegnoRepeatEvent | UpdateMaqamEvent | UpdateTempoEvent | UpdateTimeSignatureEvent;

export interface Section
{
    events: MusicEvent[];
}

export interface PieceMetaInformation
{
    composerName: string;
    lyrics: string;
    title: string;
}

export interface SheetMusic
{
    layout: OAMDB_SheetMusic_LayoutInfo;
    meta: PieceMetaInformation;
    sections: Section[];
    sectionSequence: number[];
}

export interface SingleSectionSheetMusic
{
    layout: OAMDB_SheetMusic_LayoutInfo;
    meta: PieceMetaInformation;
    events: MusicEvent[];
}