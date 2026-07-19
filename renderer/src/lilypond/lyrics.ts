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

interface PageState
{
    leftCol: (string | null)[];
    rightCol: (string | null)[];
}

function BlockToLilypondLines(block: (string | null)[])
{
    return block.map( x => "\\right-align\\line {" + ((x === null) ? "\\null" : x) + "}");
}

function RenderPage(page: PageState)
{
    const col1Text = BlockToLilypondLines(page.leftCol).join("\n");
    const col2Text = BlockToLilypondLines(page.rightCol).join("\n");

    const singleColumnCode = `
        \\column
        {
            ${col1Text}
        }
    `;
    const twoColumnCode = `
        \\hspace #1
        ${singleColumnCode}
        \\hspace #2
        \\column
        {
            ${col2Text}
        }
        \\hspace #1
    `;
    const finalTextCode = (col2Text.length === 0) ? singleColumnCode : twoColumnCode;

        return `
\\markup
{
    \\override #'(font-name . "Noto Naskh Arabic")
    {
        \\override #'(text-direction . -1)
        \\huge
        \\fill-line
        {
            ${finalTextCode}
        }
    }
}
        `;
}

function SplitIntoBlocks(lyrics: string)
{
    const lines = lyrics.split("\n");

    const blocks = [];
    let currentBlock = [];

    for (const line of lines)
    {
        const trimmed = line.trim();
        if((trimmed.length === 0) && (currentBlock.length > 0))
        {
            blocks.push(currentBlock);
            currentBlock = [];
        }
        else
            currentBlock.push(trimmed);
    }
    if(currentBlock.length > 0)
        blocks.push(currentBlock);

    return blocks;
}

export function GenerateLilyPondLyricsCode(lyrics: string, twoColumns: boolean)
{
    const blocks = SplitIntoBlocks(lyrics);

    const pageState: PageState = {
        leftCol: [],
        rightCol: []
    };
    if(twoColumns)
    {
        const linesPerColumn = blocks.Values().Map(x => x.length).Sum() / 2;

        for (const block of blocks)
        {
            if(pageState.leftCol.length > linesPerColumn)
            {
                pageState.rightCol.push(...block);
                pageState.rightCol.push(null); //end of block
            }
            else
            {
                pageState.leftCol.push(...block);
                pageState.leftCol.push(null); //end of block
            }
        }
    }
    else
    {
        for (const block of blocks)
        {
            pageState.leftCol.push(...block);
            pageState.leftCol.push(null); //end of block
        }
    }

    const pageRendered = RenderPage(pageState);
    return pageRendered;
}