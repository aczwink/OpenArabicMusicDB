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
import { MusicEvent, MusicEventType, NotesOrRestsEvent, RepeatEvent } from "../sheet-music";
import { ComputeDurationOfEvents, DurationToLilyPond } from "./duration";
import { ToLilypondNote } from "./notes";

interface EventProcessor
{
    readonly options: { unfoldRepeats: boolean };

    RenderNotes(event: NotesOrRestsEvent): string;
}

function MapMaqamId(maqamId: string)
{
    switch(maqamId)
    {
        case "kurdi":
            return "\\kurd";
        default:
            throw new Error("Can't map maqam: " + maqamId);
    }
}

async function GenerateCodeForRepeat(event: RepeatEvent, processor: EventProcessor)
{
    const nested = await ProcessEventsAndGenCode(event.nestedEvents, processor);

    let repeatType = "volta";

    if(processor.options.unfoldRepeats)
        repeatType = "unfold";
    else
    {
        const duration = ComputeDurationOfEvents(event.nestedEvents);
        if(duration.Eval() === 1)
            repeatType = "percent";
    }

    return `\\repeat ${repeatType} 2 { ${nested} }`;
}

export async function ProcessEventsAndGenCode(event: MusicEvent | MusicEvent[], processor: EventProcessor): Promise<string>
{
    if(Array.isArray(event))
    {
        const parts = await event.Values().Map(x => ProcessEventsAndGenCode(x, processor)).PromiseAll();
        return parts.join("\n");
    }

    switch(event.type)
    {
        case MusicEventType.NotesOrRests:
            return processor.RenderNotes(event);
        case MusicEventType.Repeat:
            return GenerateCodeForRepeat(event, processor);
        case MusicEventType.SegnoRepeat:
        {
            const repeated = await ProcessEventsAndGenCode(event.repeatedEvents, processor);
            const following = await ProcessEventsAndGenCode(event.followingEvents, processor);

            if(!event.fineAfterRepeat)
                throw new Error("not implemented"); //need example

            return `\\repeat segno 2 { ${repeated} \\volta 2 \\fine \\volta 1 ${following} }`;
        }
        case MusicEventType.UpdateMaqam:
            const keyPitch = ToLilypondNote(event.pitch, "english");
            return `\\key ` + keyPitch + " " + MapMaqamId(event.maqamId);

        case MusicEventType.UpdateTempo:
            return "\\tempo " + DurationToLilyPond(event.duration) + " = " + event.tempo

        case MusicEventType.UpdateTimeSignature:
            return `\\time ${event.num}/${event.den}`;
    }
}