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
\version "2.24.4"
\include "arabic.ly"

\header
{
  title = "يا مال الشام variations"
  tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}

\relative do''
{
  \key do \rast
  
  r8 do do sisb do8. sisb16 la4 |
  sisb4 do8 do sisb8. la16 sol4 |
  do8 sisb la sol sol fa misb re16 misb |
  fa8 sol sol fa misb8. re16 do16 sol' la sisb |
  
  do8 do do sisb do16 re do sisb la sisb la la |
  sisb do la sisb do re do re sisb do la sisb sol8 la16 sisb |
  do8 sib la sol sol16 la sol fa misb8 re16 misb |
  fa8 sol16 la sol la fa sol misb fa re misb do16 sol' la sisb |
  
  do8 do do sisb do8. sisb16 la4 |
  sisb4 do8 do sisb8. la16 sol4 |
  misb'16 re misb do re sisb do la sib sol la fa sol misb fa re |
  fa8 sol16 la sol8 fa misb8. re16 do16 sol' la sisb |
}