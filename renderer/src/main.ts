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
import { OAMDB_SheetMusic_Document } from "@aczwink/openarabicmusicdb-domain";
import { OctavePitch } from "@aczwink/openarabicmusicdb-domain/dist/OctavePitch";
import { EvaluateSheetMusic, EvaluationEnvironment } from "./oamdb_evaluate";
import { PieceMetaInformation, SingleSectionSheetMusic } from "./sheet-music";
import { ResolveSequence } from "./resolve-sequence";
import { GenerateLilyPondCodeFromSheetMusic } from "./lilypond/generate-code";

interface PieceInformation
{
    environment: EvaluationEnvironment;
    meta: PieceMetaInformation;
    sheetMusic: OAMDB_SheetMusic_Document;
}

function TransposeTo(music: SingleSectionSheetMusic, targetPitch: OctavePitch)
{
    //TODO: add \tranpose lilypond block
    return music;
}

export async function GenerateMIDI(pieceInfo: PieceInformation, targetPitch: OctavePitch)
{
    const evaled = await EvaluateSheetMusic(pieceInfo.sheetMusic, pieceInfo.meta, pieceInfo.environment);
    const layout = ResolveSequence(evaled);
    const transposed = TransposeTo(layout, targetPitch); //const tranposed = await TransposeTo(layout, targetPitch);

    const code = await GenerateLilyPondCodeFromSheetMusic(transposed, {
        fullAccompaniment: true,
        unfoldRepeats: true
    });
}

export async function RenderAsPDF(pieceInfo: PieceInformation, targetPitch: OctavePitch)
{
    const evaled = await EvaluateSheetMusic(pieceInfo.sheetMusic, pieceInfo.meta, pieceInfo.environment);
    const layout = ResolveSequence(evaled);
    const transposed = TransposeTo(layout, targetPitch); //const tranposed = await TransposeTo(layout, targetPitch);

    const code = await GenerateLilyPondCodeFromSheetMusic(transposed, {
        fullAccompaniment: false,
        unfoldRepeats: false
    });

    console.log(code);
}