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

export interface OAMDB_RhythmDefinition_Note
{
    note: "dom" | "tak" | "rest";
    duration: 8;
}

export interface OAMDB_RhythmDefinition_Seperation
{
    partitions: OAMDB_RhythmDefinition[];
}

export type OAMDB_RhythmDefinition = OAMDB_RhythmDefinition_Note | OAMDB_RhythmDefinition_Seperation;