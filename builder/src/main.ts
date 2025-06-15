/**
 * OpenArabicMusicDB
 * Copyright (C) 2025 Amir Czwink (amir130@hotmail.de)
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
import path from "path";
import { OpenArabicMusicDBDialect, OpenArabicMusicDBDocument, OpenArabicMusicDBForm, OpenArabicMusicDBJins, OpenArabicMusicDBMaqam, OpenArabicMusicDBMusicalPiece, OpenArabicMusicDBPerson, OpenArabicMusicDBRhythm, OpenArabicMusicDBWikiArticle } from "openarabicmusicdb-domain";
import YAML from 'yaml';
import { ParseOctavePitch } from "openarabicmusicdb-domain/dist/OctavePitch";

async function* ReadDirectoryRecursively(inputPath: string, parentPath: string): AsyncGenerator<{ filePath: string; parentPath: string; }>
{
    const children = await fs.promises.readdir(inputPath);
    for (const child of children)
    {
        const childPath = path.join(inputPath, child);
        const stats = await fs.promises.stat(childPath);
        if(stats.isDirectory())
            yield* ReadDirectoryRecursively(childPath, path.join(parentPath, child));
        else
        {
            yield {
                filePath: childPath,
                parentPath
            };
        }
    }
}

async function ReadAjnas(inputPath: string)
{
    const children = await fs.promises.readdir(inputPath);
    const result: OpenArabicMusicDBJins[] = [];
    for (const child of children)
    {
        const childPath = path.join(inputPath, child);
        const content = await fs.promises.readFile(childPath, "utf-8");
        const data = YAML.parse(content);

        const parsed = path.parse(childPath);

        result.push({
            basePitch: ParseOctavePitch(data.basePitch),
            id: parsed.name,
            name: data.name,
            intervals: data.intervals,
            text: data.text ?? "",
        });
    }

    return result;
}

async function ReadDialects(inputPath: string)
{
    const children = await fs.promises.readdir(inputPath);
    const result: OpenArabicMusicDBDialect[] = [];
    for (const child of children)
    {
        const childPath = path.join(inputPath, child);
        const content = await fs.promises.readFile(childPath, "utf-8");
        const data = YAML.parse(content);

        const parsed = path.parse(childPath);

        result.push({
            id: parsed.name,
            name: data.name,
        });
    }

    return result;
}

async function ReadForms(inputPath: string)
{
    const children = await fs.promises.readdir(inputPath);
    const result: OpenArabicMusicDBForm[] = [];
    for (const child of children)
    {
        const childPath = path.join(inputPath, child);
        const content = await fs.promises.readFile(childPath, "utf-8");
        const data = YAML.parse(content);

        const parsed = path.parse(childPath);

        result.push({
            hasLyrics: data.hasLyrics,
            id: parsed.name,
            name: data.name,
        });
    }

    return result;
}

async function ReadMaqamat(inputPath: string, ajnas: OpenArabicMusicDBJins[])
{
    const children = await fs.promises.readdir(inputPath);
    const result: OpenArabicMusicDBMaqam[] = [];
    for (const child of children)
    {
        const childPath = path.join(inputPath, child);
        const content = await fs.promises.readFile(childPath, "utf-8");
        const data = YAML.parse(content);

        const parsed = path.parse(childPath);
        const jins = ajnas.find(x => x.id === data.rootJins)!;

        result.push({
            dominant: data.dominant,
            id: parsed.name,
            name: data.name,
            basePitch: (data.basePitch === undefined) ? jins.basePitch : ParseOctavePitch(data.basePitch),
            rootJinsId: data.rootJins,
            additionalIntervals: data.additionalIntervals,
            text: data.text,
            branchingAjnas: (data.forms.map((x: any) => x.branchingJins))
        });
    }

    return result;
}

async function ReadMusicalPieces(dbSrcPath: string, forms: OpenArabicMusicDBForm[], persons: OpenArabicMusicDBPerson[])
{
    function YearToCentury(year: number)
    {
        const century = Math.floor(year / 100) + 1;
        return century + "th century";
    }

    function FormReleaseDate(composerId: string, releaseDate?: string)
    {
        if(releaseDate === undefined)
        {
            const composer = persons.find(x => x.id === composerId)!;
            if(composer.lifeTime !== undefined)
            {
                if(composer.lifeTime.deathYear === undefined)
                    return YearToCentury(composer.lifeTime.birthYear);
                return YearToCentury(Math.round((composer.lifeTime.birthYear + composer.lifeTime.deathYear) / 2));
            }
            return "unknown";
        }

        return releaseDate;
    }

    const inputPath = dbSrcPath + "/musical_pieces";
    const result: OpenArabicMusicDBMusicalPiece[] = [];
    for await (const fileEntry of ReadDirectoryRecursively(inputPath, "/musical_pieces"))
    {
        if(path.extname(fileEntry.filePath) !== ".yml")
            continue;

        const content = await fs.promises.readFile(fileEntry.filePath, "utf-8");
        const data = YAML.parse(content);

        const parsed = path.parse(fileEntry.filePath);
        const form = forms.find(x => x.id === data.form)!;

        for (const attachment of data.attachments)
        {
            if((attachment.type === "public") && (!attachment.uri.startsWith("/")))
            {
                const absPath = path.join(fileEntry.parentPath, attachment.uri);
                attachment.uri = absPath;
            }
        }

        result.push({
            composerId: data.composer,
            formId: data.form,
            id: parsed.name,
            name: data.name,
            releaseDate: FormReleaseDate(data.composer, data.releaseDate),
            text: data.text,
            maqamat: data.maqamat.map((x: any) => ({ maqamId: x.maqam, explanation: x.explanation })),
            rhythms: data.rhythms.map((x: any) => ({ rhythmId: x.rhythm, explanation: x.explanation })),
            lyrics: form.hasLyrics ? ({
                dialectId: data.dialect,
                singerIds: data.singers,
                songWriterId: data.songWriter,
                text: data.lyrics
            }) : undefined,
            attachments: data.attachments
        });
    }

    return result;
}

async function ReadPersons(inputPath: string)
{
    function ParseLifeTime(lifeTime?: string)
    {
        if(lifeTime === undefined)
            return undefined;

        const lifeTimeParts = lifeTime.split("-").map(x => x.trim());

        return {
            birthYear: parseInt(lifeTimeParts[0]),
            deathYear: (lifeTimeParts[1].length === 0) ? undefined : parseInt(lifeTimeParts[1]),
        };
    }

    const children = await fs.promises.readdir(inputPath);
    const result: OpenArabicMusicDBPerson[] = [];
    for (const child of children)
    {
        const childPath = path.join(inputPath, child);
        const content = await fs.promises.readFile(childPath, "utf-8");
        const data = YAML.parse(content);

        const parsed = path.parse(childPath);

        result.push({
            lifeTime: ParseLifeTime(data.lifeTime),
            origin: data.origin,
            id: parsed.name,
            name: data.name,
            text: data.text,
            locations: (typeof data.locations === "string") ? [data.locations] : data.locations,
            image: data.image
        });
    }

    return result;
}

async function ReadRhythms(inputPath: string)
{
    const children = await fs.promises.readdir(inputPath);
    const result: OpenArabicMusicDBRhythm[] = [];
    for (const child of children)
    {
        const childPath = path.join(inputPath, child);
        const content = await fs.promises.readFile(childPath, "utf-8");
        const data = YAML.parse(content);

        const parsed = path.parse(childPath);

        result.push({
            id: parsed.name,
            alternativeNames: data.alternativeNames,
            category: data.category,
            usageText: data.usageText,
            name: data.name,
            text: data.text,
            timeSignatureNumerators: ("timeSignatureNumerators" in data) ? data.timeSignatureNumerators : [data.timeSignatureNumerator],
        });
    }

    return result;
}

async function ReadWikiArticles(inputPath: string)
{
    const articleFiles = await fs.promises.readdir(inputPath);
    const articles: OpenArabicMusicDBWikiArticle[] = [];
    for (const articleFile of articleFiles)
    {
        const childPath = path.join(inputPath, articleFile);
        const text = await fs.promises.readFile(childPath, "utf-8");

        const parsed = path.parse(childPath);
        articles.push({
            text,
            title: parsed.name
        })
    }

    return articles;
}

async function BuildDatabase(dbSrcPath: string)
{
    const ajnas = await ReadAjnas(dbSrcPath + "/ajnas");
    const forms = await ReadForms(dbSrcPath + "/forms");
    const persons = await ReadPersons(dbSrcPath + "/persons");

    const finalDB: OpenArabicMusicDBDocument = {
        ajnas,
        articles: await ReadWikiArticles(dbSrcPath + "/wiki"),
        dialects: await ReadDialects(dbSrcPath + "/dialects"),
        forms,
        maqamat: await ReadMaqamat(dbSrcPath + "/maqamat", ajnas),
        musicalPieces: await ReadMusicalPieces(dbSrcPath, forms, persons),
        persons,
        rhythms: await ReadRhythms(dbSrcPath + "/rhythms"),
    };
    const stringified = JSON.stringify(finalDB);
    await fs.promises.writeFile("./dist/db.json", stringified, "utf-8");
}

const dbSrcPath = process.argv[2];
BuildDatabase(dbSrcPath);