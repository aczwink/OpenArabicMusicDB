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
import child_process from "child_process";
import fs from "fs";
import os from "os";
import path from "path";
import { OAMDB_SheetMusic_Document } from "@aczwink/openarabicmusicdb-domain";
import { OctavePitch } from "@aczwink/openarabicmusicdb-domain/dist/OctavePitch";
import { EvaluateSheetMusic, EvaluationEnvironment } from "./oamdb_evaluate";
import { PieceMetaInformation } from "./sheet-music";
import { ResolveSequence } from "./resolve-sequence";
import { GenerateLilyPondCodeFromSheetMusic } from "./lilypond/generate-code";

interface PieceInformation
{
    environment: EvaluationEnvironment;
    meta: PieceMetaInformation;
    sheetMusic: OAMDB_SheetMusic_Document;
}

async function CallLilypond(tempDir: string, lilyPondCode: string, outputFormat: "mid" | "pdf" | "png")
{
    const flag = (outputFormat === "mid") ? "" : ("--" + outputFormat);

    const promise = new Promise<void>( (resolve, reject) => {
        const process = child_process.exec("lilypond " + flag + " -", {
            cwd: tempDir,
        }, (err, _stdout, _stderr) => {
            if(err)
                reject(err.message + _stdout + _stderr);
            else
                resolve();
        });
        process.stdin?.end(lilyPondCode);
    });
    await promise;

    switch(outputFormat)
    {
        case "mid":
        case "pdf":
            await fs.promises.rename(path.join(tempDir, "-." + outputFormat), path.join(tempDir, "_output." + outputFormat));
            break;
        case "png":
            const child2 = child_process.exec("convert -trim -.png _output.png", {
                cwd: tempDir,
            });
        
            await new Promise( (resolve, reject) => {
                child2.on("exit", resolve);
                child2.on("error", reject);
            });
            break;
    }
}

async function RunLilyPond(lilyPondCode: string, outputFormat: "mid" | "pdf" | "png")
{
    const dir = await fs.promises.mkdtemp(`${os.tmpdir()}${path.sep}ame`, "utf-8");

    await CallLilypond(dir, lilyPondCode, outputFormat);

    const outputPath = path.join(dir, "_output." + outputFormat);
    const data = await fs.promises.readFile(outputPath);

    await fs.promises.rm(dir, { recursive: true });

    return data;
}

export async function GenerateMIDI(pieceInfo: PieceInformation, targetPitch: OctavePitch)
{
    const evaled = await EvaluateSheetMusic(pieceInfo.sheetMusic, pieceInfo.meta, pieceInfo.environment);
    const layout = ResolveSequence(evaled);
    //const tranposed = await TransposeTo(layout, targetPitch); //in future lilypond should not be used for midi generation to support stuff like accompaniments and so on. for that real note transposition is required
    const transposed = layout;

    const code = await GenerateLilyPondCodeFromSheetMusic(transposed, targetPitch, {
        fullAccompaniment: true,
        unfoldRepeats: true
    });

    return RunLilyPond(code, "mid");
}

export async function RenderAsPDF(pieceInfo: PieceInformation, targetPitch: OctavePitch)
{
    const evaled = await EvaluateSheetMusic(pieceInfo.sheetMusic, pieceInfo.meta, pieceInfo.environment);
    const layout = ResolveSequence(evaled);

    const code = await GenerateLilyPondCodeFromSheetMusic(layout, targetPitch, {
        fullAccompaniment: false,
        unfoldRepeats: false
    });

    return RunLilyPond(code, "pdf");
}