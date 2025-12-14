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
  title = "سماعي حجاز كار كرد"
  composer = "Tatyos Ekserciyan"
  tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}

\score {
  \header {
    piece = ""
  }
  \new Staff \relative sol'
  {
    \set Staff.extraNatural = ##f
    \key do \kurd
    \time 10/8
    
    \set Timing.beamExceptions = #'()
    \set Timing.baseMoment = #(ly:make-moment 1/8)
    \set Timing.beatStructure = 2,1,2,2,2,1
    
    \mark "I"
    \repeat volta 2
    {
      \alternative {
        { do, do'8 do16 reb do sib lab sol lab sib do4 r8 | }
        { do,4 do'8 do16 reb do sib lab sol lab sib do16( sib32 lab sol fa mib reb do8) | }
      }
      do' reb fa mib8. reb16 do8. sib16 sib lab lab sol lab8 |
      mib8. lab16 sol sib lab8. do16 sib la sib reb do8 sib lab |
    }
    \alternative {
      { sol8. fa'16 mib reb do8. sib16 lab sol lab sib do16( sib32 lab sol fa mib reb do8) | }
      { sol'8. fa'16 mib reb do8. sib16 lab sol lab sib do4 r8 | }
    }
    \break
    
    \mark "تسليم"
    \repeat volta 2
    {
      reb^\markup{ \musicglyph "scripts.segno" } do sib lab8. sol16 fa16 mib fa sol lab4 r8 |
      sol lab do sib8. lab16 \tuplet 6/4 { sib( lab sol lab sol fa) } sol8.( fa16 mib reb |
      do4) lab'8 sol8. fa16 mib16. lab32 sol16 fa fa4 r8 |
    }
    \alternative {
      { mib16 fa sol lab sol fa mib sol fa sol mib reb reb do mib16( fa sol lab sib do) | }
      { mib,16 fa sol lab sol fa mib sol fa sol mib reb reb do do4 r8 | }
    }
    \break
    
    \mark "II"
    \repeat volta 2
    {
      do4 sol'8 sol16 lab sol fa sol fa mi fa sol4 r8 |
      mi16 fa sol lab sol fa mi8. fa16 mi reb reb do do4 si8 |
      do reb mi fa8. do16 reb8 mi fa sol lab |
      fa sol lab si lab16 sol mi'8 reb16 do do4 r8-\markup { \italic "D.S. " \tiny \raise #1 \musicglyph "scripts.segno"} |
    }
    \break
    
    \mark "III"
    \repeat volta 2
    {
      lab16 sol lab8 fa mib4 reb'16 do reb sib do4 r8 |
      do reb re mib8. do16 reb8 do sib4 la8 |
      sib la sib reb8. do16 sib8 lab sol fad sol |
      lab la sib do sib16 la mib'8 reb16 do do4 r8-\markup { \italic "D.S. " \tiny \raise #1 \musicglyph "scripts.segno"} |
    }
    \break
    
    \mark \markup { "IV" }
    \time 6/8
    \set Timing.beamExceptions = #'()
    \set Timing.baseMoment = #(ly:make-moment 1/8)
    \set Timing.beatStructure = 2,2,2
    \repeat volta 2
    {
      sib8. do16 \tuplet 3/2 { reb8( do sib) } \tuplet 3/2 { lab( sol fa) } |
      \tuplet 3/2 { sol( lab sib) } do4 r |
      \tuplet 3/2 { do8( reb mib) } \tuplet 3/2 { fa( mib reb) } \tuplet 3/2 { reb( do sib) } |
      \tuplet 3/2 { mib( reb do) } do4 r |
      sol8. la16 sib8. la16 sib8. la16 |
      sib8. do16 \tuplet 3/2 { reb8( do sib) } \tuplet 3/2 { lab( sol fa) } |
      \tuplet 3/2 { reb'8( do sib) } \tuplet 3/2 { lab( sol fa) } mib8. reb16 |
      reb8. do16 do4 r |
    }
    \repeat volta 2
    {
      do'8. sib16 \tuplet 3/2 { lab8( sol fa) } \tuplet 3/2 { mib( fa sol) } |
      \tuplet 3/2 { lab( sol sib) } lab4 r |
      sol8. lab16 la8. sib16 si8. do16 |
      \tuplet 3/2 { reb8( do si) } do4 r |
      fa8. mib16 reb8. do16 sib8. lab16 |
      sol8. fa16 fa4 r |
      \tuplet 3/2 { mib8( fa sol) } \tuplet 3/2 { lab8( sol fa) } mib8. reb16 |
      reb8. do16 do4 r-\markup { \italic "D.S. " \tiny \raise #1 \musicglyph "scripts.segno"} |
    }
  }
}