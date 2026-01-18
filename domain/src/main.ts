/**
 * OpenArabicMusicDB
 * Copyright (C) 2021-2026 Amir Czwink (amir130@hotmail.de)
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

import { OctavePitch } from "./OctavePitch";

export type CountryCode = "eg" | "gr" | "iq" | "lb" | "ly" | "sy" | "tn" | "tr" | "ye";

export enum Interval
{
    OneAndAHalfTones = "3/2",
    SemiTone = "1/2",
    ThreeQuarters = "3/4",
    Tone = "1",
}

interface FileReference
{
    type: "external" | "private" | "public";
    contentType: string;
    uri: string;
}

export interface OpenArabicMusicDBAttachment extends FileReference
{
    comment: string;
}

export interface OpenArabicMusicDBDialect
{
    id: string;
    name: string;
}

export interface OpenArabicMusicDBForm
{
    id: string;
    name: string;
    hasLyrics: boolean;
}

export interface OpenArabicMusicDBJins
{
    id: string;
    name: string;
    basePitch: OctavePitch;
    intervals: Interval[];
    text: string;
}

export interface OpenArabicMusicDBMaqam
{
    id: string;
    name: string;
    rootJinsId: string;
    basePitch: OctavePitch;
    dominant: 3 | 4 | 5 | 34;
    additionalIntervals: Interval[];
    text: string;
    branchingAjnas: string[];
}

export interface OpenArabicMusicDBMusicalPiece
{
    id: string;
    name: string;
    formId: string;
    composerId: string;
    releaseDate: string;
    text: string;
    maqamat: { maqamId: string; explanation: string }[];
    rhythms: { rhythmId: string; explanation: string }[];
    lyrics?: {
        text: string;
        dialectId: string;
        singerIds: string[];
        songWriterId: string;
    };
    attachments: OpenArabicMusicDBAttachment[];
}

export interface OpenArabicMusicDBPerson
{
    id: string;
    name: string;
    lifeTime?: {
        birthYear: number;
        deathYear?: number;
    };
    origin: string;
    text: string;
    locations: CountryCode[];
    image?: FileReference;
}

export interface OpenArabicMusicDBRhythm
{
    id: string;
    name: string;
    alternativeNames: string;
    category: string;
    usageText: string;
    timeSignatureNumerators: number[];
    text: string;
}

export interface OpenArabicMusicDBWikiArticle
{
    title: string;
    text: string;
}

export interface OpenArabicMusicDBDocument
{
    ajnas: OpenArabicMusicDBJins[];
    articles: OpenArabicMusicDBWikiArticle[];
    dialects: OpenArabicMusicDBDialect[];
    forms: OpenArabicMusicDBForm[];
    maqamat: OpenArabicMusicDBMaqam[];
    musicalPieces: OpenArabicMusicDBMusicalPiece[];
    persons: OpenArabicMusicDBPerson[];
    rhythms: OpenArabicMusicDBRhythm[];
}