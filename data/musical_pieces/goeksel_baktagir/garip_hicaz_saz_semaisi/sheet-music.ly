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
\language "italiano"

\header
{
  title = "Garip (Hicaz Saz Semaisi)"
  composer = "Göksel Baktagir"
  tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2026 Amir Czwink" }
}

#(set-global-staff-size 21)

\score {
  \header {
    piece = ""
  }
  \new Staff \relative sol'
  {
    \set Staff.extraNatural = ##f
    \key fa \hijaz
    \time 10/8
    
    \set Timing.beamExceptions = #'()
    \set Timing.baseMoment = #(ly:make-moment 1/8)
    \set Timing.beatStructure = 1,1,1,1,1,1,1,1,1,1
    \tempo 4 = 50
    
    \mark "I"
    \repeat volta 2
    {
      fa la16 sib do8 fa, reb'4 do16 reb do sib la solb |
      fa4 solb16 sib la8. solb16 fa8 la16 sib do4 r8 |
      fa,8 do'16 resb mib8 reb16 do do fa mib reb do sib la4 \tuplet 3/2 { solb16 fa solb } |
      fa4 solb8 la8. do16 sib8  la16 solb fa4 r8 |
    }
    \break
    
    \mark "تسليم"
    \repeat volta 2
    {
      do'4.^\markup{ \musicglyph "scripts.segno" } do16 sib8. reb16 do do mib do4 sib16 do |
      sib4 sib8 sib16 la r8 do16 sib sib reb sib4 la16 sib |
      solb4 mib'8 mib16 re8 fa16 mib reb do sib la4 solb8 |
      fa4 solb8 la8. do16 sib8  la16 solb fa4 r8 |
    }
    \break
    
    \mark "II"
    \repeat volta 2
    {
      la4 solb8 fa4 do'8 la sib4 r8 |
      sib16 do sib la la sib la solb solb la solb fa sib la32 sib la4 r8 |
      la16 sib do resb mib8 fa mib16 reb do sib la solb solb4 fa8 |
      fa4 solb8 la8. do16 sib8  la16 solb fa4 r8-\markup { \italic "D.S. " \tiny \raise #1 \musicglyph "scripts.segno"} |
    }
    \break
    
    \mark "III"
    \repeat volta 2
    {
      fa8 fa16 la do fa mib4 solb16 mib fa reb do8. la16 sib solb |
      fa8 fa16 la \tuplet 3/2 { do mib re }  reb4 fa16 reb mib do sib4 r8 |
      sib16 solb'32 fa solb16 la fa mib reb mib8 do16 sib reb8 sib16 la4 solb8 |
      fa4 solb8 la8. do16 sib8  la16 solb fa4 r8-\markup { \italic "D.S. " \tiny \raise #1 \musicglyph "scripts.segno"} |
    }
    \break
    
    \mark \markup { "IV" }
    \time 3/4
    \set Timing.beamExceptions = #'()
    \set Timing.baseMoment = #(ly:make-moment 1/4)
    \set Timing.beatStructure = 1,1,1
    \tempo 4 = 130
    
    \repeat volta 2
    {      
      fa2 solb4 |
      mib fa solb |
      fa2. |
      la4 sib do |
      sib2 la8 solb |
      solb2. |
      reb'8 do reb4 mib |
      
      \alternative {
        { do8 sib la4 solb | }
        { do2. | }
      }
    }
    \repeat volta 2
    {
      do2 fa4 |
      mib8 resb mib4 reb8 r |
      reb do reb4 do8 r |
      do reb sib4 r |
      sib8 do la4 r |
      
      \alternative {
        {
          solb reb'16 mib reb mib reb8 do |
          do2. |
          fa,8 solb la sib do r |
        }
        { solb4 sib16 do sib8 la solb | }
      }
    }
    \repeat volta 2
    {
      fa2. |
      fa2 solb4 |
      mib fa solb |
      fa2. |
      solb4 la sib |
      solb2. |
      mib'2 do8 sib |
      la4 solb8 solb solb fa |
      fa2.-\markup { \italic "D.S." \tiny \raise #1 \musicglyph "scripts.segno" \italic "al Fine" } |
    }
  }
}