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
import { OpenArabicMusicDBDocument, OpenArabicMusicDBWikiArticle } from "openarabicmusicdb-domain";

async function BuildDatabase(dbSrcPath: string)
{
    const inputPath = dbSrcPath + "/wiki";
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

    const finalDB: OpenArabicMusicDBDocument = {
        articles
    };
    const stringified = JSON.stringify(finalDB);
    await fs.promises.writeFile("./dist/db.json", stringified, "utf-8");
}

const dbSrcPath = process.argv[2];
BuildDatabase(dbSrcPath);