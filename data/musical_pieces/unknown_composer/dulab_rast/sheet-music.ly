%  OpenArabicMusicDB
%  Copyright (C) 2025 Amir Czwink (amir130@hotmail.de)
  
%  This program is free software: you can redistribute it and/or modify
%  it under the terms of the GNU Affero General Public License as published by
%  the Free Software Foundation, either version 3 of the License, or
%  (at your option) any later version.
  
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU Affero General Public License for more details.
 
%  You should have received a copy of the GNU Affero General Public License
%  along with this program.  If not, see <http://www.gnu.org/licenses/>.
\version "2.20.0"
\include "arabic.ly"

#(set-global-staff-size 26)

\header
{
	title = "دولاب راست"
	composer = "Unknown"
    tagline = "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink"
}

\relative do'
{
	\key do \rast
	\set Staff.extraNatural = ##f
	
	\partial 4 la'8 sisb |
	
	\repeat volta 2
	{
	  
	  \repeat percent 2
	  {
	    do4 sib8 la sol la sol fa |
	    misb fa misb re do4 la'8 sisb |
	  }
	  do4 sib8 la sol la sol fa |
	  misb fa misb re do4 re8 misb |
	  fa4. misb8 misb re re do |
	}
	\alternative
	{
	  { do4 r2 la'8 sisb | }
	  { do,4 fa8 fa fa4 fa}
	}
	
	\repeat volta 2
	{	
	  do8 fa4 sol8 fa sol fa8. misb16 |
	  re8 misb4 fa8 misb fa misb8. re16 |
	  do8 re4 fa8 misb re do sisb |
	}
	\alternative
	{
	  { do re misb fa sol misb fa4 }
	  { do sol do re |}
	}
	misb do re sisb
	do1
}