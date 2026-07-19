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
import fs from "fs";
import { ParseOctavePitch } from "@aczwink/openarabicmusicdb-domain/dist/OctavePitch";
import { RenderAsPDF } from "./main";
import { OpenArabicMusicDBDocument } from "@aczwink/openarabicmusicdb-domain";

export async function DevMain()
{
    const pieceId = process.argv[2];
    const targetPitch = process.argv[3]!;

    const db = JSON.parse(await fs.promises.readFile("../../builder/dist/db.json", "utf-8")) as OpenArabicMusicDBDocument;
    const piece = db.musicalPieces.find(x => x.id === pieceId)!;
    const composer = db.persons.find(x => x.id === piece.composerId)!;

    await RenderAsPDF({
        environment: {
            async lookupRhythm(rhythmId)
            {
                return db.rhythms.find(x => x.id === rhythmId)?.rhythm!;
            },
        },
        meta: {
            composerName: composer.name,
            lyrics: piece.lyrics?.text ?? "",
            title: piece.name
        },
        sheetMusic: piece.sheetMusic!
    }, ParseOctavePitch(targetPitch));
}

DevMain();