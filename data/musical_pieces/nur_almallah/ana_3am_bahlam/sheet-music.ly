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
  title = "أنا عم بحلم"
  composer = "نور الملاح"
  tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2026 Amir Czwink" }
}

\score {
  <<
    \new Staff \relative sol'
    {
      \key do \kurd
      \set Staff.extraNatural = ##f
      \time 4/4
      
      %prelude
      \repeat volta 2
      {
        reb'8 do sib8. sib16 do la8 sib16 do8 la |
        reb do sib8. do16 la sib8 do16 do4 |
        lab8 sol fa8. fa16 sol mi8 fa16 sol8 mi |
        fa mib reb8. mib16 do reb8 mib16 mib4 |
      }
      
      %intro
      \repeat volta 2
      {
        \mark \markup { \musicglyph "scripts.segno" }
        do'8 do16 reb do8 reb fa4. sol8 |
        mib reb do sib fa'4. sol8 |
        mib reb do sib mib4.  sol8 |
        mib fa mib reb do sol' mib reb |
      }
      \time 2/4
      do8 do16 reb do reb do reb mib8 do16 reb do reb mib8 |
      do do16 reb mib reb do sib reb8 sib16 do sib do reb8 |
      sib sib,16 do reb do reb mib fa8 reb16 mib reb mib fa8 |
      reb reb16 mib fa sol fa mib reb do reb mib fa sol lab sib^\markup { "Al Coda" } |
      \time 4/4
      \repeat volta 2
      {
        do8 do16 reb do8 reb fa4. sol8 |
        mib reb do sib fa'4. sol8 |
        mib reb do sib mib4.  sol8 |
        \alternative {
          { mib fa mib reb do sol' mib reb | }
          { mib fa mib reb do8 r4 do,16 reb | }
        }
      }
      
      %refrain
      \repeat volta 3
      {
        \repeat volta 2
        {
          \mark \markup { \musicglyph "scripts.segno" "2" }
          mib8. reb16 do8 sib fa' sib fa'4 |
          r8 sol,4 mib16 reb do4 fa8 fa'16 mib |
          fa8 fa, sol fa mib re mib fa |
          \alternative {
            { sol8. fa16 mib8 reb mib8. reb16 do8 do16 reb | }
            { sol8. fa16 mib8 reb mib4 fa | }
          }
        }
        \time 2/4
        r8 fa r sol |
        mib4 reb |
        r8 mib r fa |
        reb8. do16 sib8 sib'( |
        lab) r reb,8. do16 |
        sib8 lab sib do |
        reb mib fa sol |
        sib4 lab8 sol |
        fa mib reb do |
        mib4. mib16 fa |
        sol8 mib fa reb |
        \alternative {
          { do do16 sib do8 do16 reb | }
          { do8_\markup { "D.S. al Coda" } do16 sib do8 r8 | }
          {
            \once \override Score.VoltaBracket.text = \markup { \text { \italic "Fine" } }
            do2 do' \fine |
          }
        }
      }
      
      %verse
      \time 4/4
      \repeat volta 2
      {
        do8^\markup { \musicglyph "scripts.coda" } do do do reb reb do4 |
        sib8 sib sib sib do do sib4 |
        lab8 lab lab sib sol fa sol16 lab sol fa |
        mib8 mib sib' sol lab fa fa4 |
        mib reb8 mib fa sol fa4 |
      }
      \time 2/4
      do lab'8 sol |
      fa2( |
      fa4.) sib8 |
      lab sol fa lab |
      sol fa mib fa( |
      fa) sol4.( |
      sol4.) fa8 |
      sol fa mib lab |
      sol fa mib reb |
      do reb mib reb |
      do4. do'8 |
      do lab4.( |
      lab) reb8 |      
      do sib lab do |
      sib lab sol lab |
      reb2( |
      reb4.) fa,8 |
      sol fa mib lab |
      sol fa mib4 |
      do8 reb mib4(
      mib2) |
      fa2( |
      fa2) |
      mib8 reb reb do |
      do mib sol do mib sol do r |
      r4_\markup { "D.S.2 al Fine" } r8 do,,16 reb |
    }
  >>
}