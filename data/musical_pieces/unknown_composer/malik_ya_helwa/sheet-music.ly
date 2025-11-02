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
  title = "مالك يا حلوة"
  composer = ""
  tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}

suznak = #`(
    (0 . ,NATURAL)
    (1 . ,NATURAL)
    (2 . ,SEMI-FLAT)
    (3 . ,NATURAL)
    (4 . ,NATURAL)
    (5 . ,FLAT)
    (6 . ,NATURAL)
  )

\relative do'
{
  \key do \suznak
  \set Staff.extraNatural = ##f
  
  \repeat volta 2
  {
    do8 misb4 fa8 sol4 lab8 sol |
    fa si lab sol sol misb16 fa sol8 misb16 fa |
    sol8 sol sol sol sol fa fa misb  |
    
    \alternative
    {
      { misb re re do do misb16 fa sol fa misb re | }
      { misb8 re re do do misb16 fa sol8 la16 sisb | }
    }
  }
  
  do8 misb,4 fa8 sol4 lab16 si sol lab |
  fa8 si lab sol sol si16 do re si do lab |
  sol8 sol sol sol sol fa fa misb |
  misb re re do do4 misb8. re16 |
  do8 misb16 misb misb8 misb fa misb misb misb |
  sol4 fa8 misb fa8. misb16 re4 |
  r8 sol fa misb re do misb re |
  fa misb re do do misb misb misb |
  r sol fa misb re do misb re |
  fa misb re4 do8 misb16 fa sol fa misb re |
}