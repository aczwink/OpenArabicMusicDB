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
  title = "ما تيجي هنا"
  composer = "وليد سعد"
  tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}


%#(set-global-staff-size 23)

\score {
  \header {
    piece = ""
  }
  \new Staff \relative sol'
  {
    \key mi \kurd
    \time 4/4
    
    \repeat volta 2
    {
      r8 mi4 mi8 mi4 r |
      dod16 re mi4 mi8 mi4 r |
      re16 mi fa4 fa8 fa4 r |
      dod16 re mi4 mi8 mi4 r |
    }
    \repeat volta 2
    {
      re8 mi mi'16 mi mi,8 mi mi'16 mi mi,8 mi'16 mi |
      dod,16 re mi8 mi'16 mi mi,8 mi mi'16 mi mi,8 mi'16 mi |
      re,8 fa fa'16 fa fa,8 fa fa'16 fa fa,8 fa'16 fa |
      la,16 sol fa mi sol la sol la fa sol fa sol mi4 |
    }
    \repeat volta 2
    {
      \repeat percent 2
      {
        r16 re16 mi mi mi mi mi mi fa8 mi4 r8 |
      }
      r16 mi16 fa fa fa8 fa sol8. fa16 fa fa la8 |
      r8 sol8 la sol fa mi r4 |
    }
    \repeat volta 2
    {
      r8 la la la16 la si8 la4 la8 |
      sol16 sol la sol sol sol sol8 la sol4 fa8 |
      fa la sol fa la8. sol16 fa8 mi16 mi |
      mi8 fa sol la si4 la |
    }
  }
}