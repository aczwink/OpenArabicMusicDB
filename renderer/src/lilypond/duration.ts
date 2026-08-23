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

import { Fraction } from "@aczwink/acts-util-core";
import { MusicEvent, MusicEventType } from "../sheet-music";

function ComputeDurationOfEvent(event: MusicEvent): Fraction
{
    switch(event.type)
    {
        case MusicEventType.NotesOrRests:
            return event.notesOrRests.Values().Map(x => x.duration).Accumulate( (a, b) => a.Add(b) );
        case MusicEventType.Repeat:
            const inner = ComputeDurationOfEvents(event.nestedEvents);
            return inner.Scale(2);
    }

    return new Fraction(0, 1);
}

export function ComputeDurationOfEvents(events: MusicEvent[])
{
    return events.Values().Map(ComputeDurationOfEvent).Accumulate( (a, b) => a.Add(b) );
}

export function DurationToLilyPond(duration: Fraction)
{
    switch(duration.num)
    {
        case 1:
            return duration.den;
        case 3:
            return (duration.den / 2) + ".";
    }

    throw new Error("Illegal duration value: " + duration.ToString());
}