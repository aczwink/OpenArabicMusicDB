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

import { MusicEvent, MusicEventType, Section, SheetMusic, SingleSectionSheetMusic } from "./sheet-music";

function LayoutSectionsWithDasSegnoAlFine(sections: Section[]): MusicEvent[]
{
    return [
        {
            type: MusicEventType.Repeat,
            nestedEvents: sections[0]!.events,
        },
        {
            type: MusicEventType.SegnoRepeat,
            repeatedEvents: [
                {
                    type: MusicEventType.Repeat,
                    nestedEvents: sections[1]!.events
                }
            ],
            fineAfterRepeat: true,
            followingEvents: sections[2]!.events,
        }
    ];
}

export function ResolveSequence(sheetMusic: SheetMusic): SingleSectionSheetMusic
{
    /*const groups = sheetMusic.sectionSequence.Values().GroupAdjacent(x => x.toString());

    const finalSections: Section[] = [];
    const finalSectionSequence = [];
    for (const group of groups)
    {
        const sectionIndex = group[0];
        finalSectionSequence.push(sectionIndex);

        const section = sheetMusic.sections[sectionIndex];
        if(group.length === 1)
            finalSections.push(section);
        else
        {
            finalSections.push({
                melody: [
                    {
                        type: MelodyEventType.Repeat,
                        nestedEvents: section.melody
                    }
                ]
            });
        }
    }

    if(finalSectionSequence.Equals([0, 1, 2, 1]))
    {
        flattened = this.LayoutSectionsWithDasSegnoAlFine(finalSections);
    }*/
    let flattened;
    if(sheetMusic.sectionSequence.Equals([0, 0, 1, 1, 2, 1]))
    {
        flattened = LayoutSectionsWithDasSegnoAlFine(sheetMusic.sections);
    }
    else
    {
        //console.log(sheetMusic.sectionSequence, finalSectionSequence);
        console.log(sheetMusic.sectionSequence);
        throw new Error("Method not implemented.");
    }

    return {
        events: flattened,
        layout: sheetMusic.layout,
        meta: sheetMusic.meta,
    };
}