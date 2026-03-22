%  OpenArabicMusicDB
%  Copyright (C) 2026 Amir Czwink (amir130@hotmail.de)
  
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
  title = "فايق يا هوى"
  composer = "فيلمون وهبي"
  tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2026 Amir Czwink" }
}

melody = \relative sol'
{
  \key la \bayati
  \set Staff.extraNatural = ##f
  \time 4/4
  
  %Intro
  \repeat volta 2
  {
    la8. sol16 la8 mi la16 sib sol la fa sol mi8 |
    sol8. fad16 sol8 re sol16 la fa sol mi fa re mi |
    fa8. mi16 fa8 do fa16 sol mi fa re mi do re |
    mi re re do do sisb sisb la
    \alternative {
      { la sisb32 do re mi fasd sol la4 | }
      { la r \section | }
    }
  }
  
  \break
  
  %Refrain  
  \repeat volta 2
  {
    \repeat volta 2
    {
      fa8 fa16 mi fa8 sol mi16 fa mi re mi4 |
      la,8 mi' mi16 re mi fa
      \alternative {
        { re8 do16 sisb do8 sisb16 la | }
        { re mi re do re4 | }
      }
    }
    do8 re16 mi re mi do8 re16 mi do re sisb8 la |
    la16 la sisb8 do re re mi16 fasd sol4 |
    sol8 sol16 fasd sol la sol fasd sol la sol fasd sol4 |
    sol8. do16( do) sisb8 la16
    \alternative {
      { la sol fa mi re do sisb la | }
      { la2 \fine }
    }
  }
  
  \break
  
  %Verse  
  \repeat volta 2
  {
    la'8 la sol fasd sol16 la fasd sol mi4 |
    fasd16 fasd sol8 fasd16 mi re8 mi fasd sol4 |
    la8 la sol fasd sol16 la sol fasd fasd mi re8 |
    re mi16 fasd mi8 re
    \alternative {
      { si dosd re4 | }
      { re8. dosd16 mi8 re | }
    }
  }
  
  \repeat volta 2
  {
    fasd mi16 re sol8 fasd16 mi mi fasd mi re mi8 dosd |
    mi re16 dosd fasd8 mi re16 mi re dosd mi8 re |
  }
  re sol16 la sol8 fasd sol16 la sol fasd sol4 |
  sol16 sol do8( do16) sisb8 la16 la sol fa mi re do sisb la \section |
}

\language "english"
chordsStaff = \chordmode
{
	\set chordChanges = ##t
	
	%intro
	a1:min
	g2:min d:min
	bf c
	g:min a:5.8 a:5.8
	
	%refrain
	d2:min d2:5.8/a
	d1:5.8/a d2:5.8/a
	c g:min
	a1:5.8
	g1:5.8
	a1:5.8 a2:5.8
	
	%verse
	d1:5.8
	e:min
	d:5.8
}

\score {
 <<
  \new ChordNames \chordsStaff
  \new Staff \melody
 >>
}