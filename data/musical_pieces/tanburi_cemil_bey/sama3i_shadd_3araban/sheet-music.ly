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
\language "italiano"

\header
{
	title = "سماعي شد عربان"
	composer = "Tanburi Cemil Bey"
  tagline = "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink"
}

#(set-global-staff-size 23)

\score {
  \header {
    piece = ""
  }
  \new Staff \relative sol'
  {
    \set Staff.extraNatural = ##f
    \key sol \hijaz_kar
    \time 10/8
    
    \set Timing.beamExceptions = #'()
    \set Timing.baseMoment = #(ly:make-moment 1/8)
    \set Timing.beatStructure = 1,1,1,1,1,1,1,1,1,1
    
    \mark "I"
    \repeat volta 2
    {
      sol4 si16 lab lab16. si32 lab16 sol sol16. fad32 mib16 fad sol8 fad16 mib re do |
      do'4 re16 do si16. lab32 sol8 mib'16. re32 do16 re si8 do r |
      si do re-1 mib16-1 fad mib re do8 re16 mib re do si lab si8 |
      do r mib re do si lab sol16 si re si sol8 |
    }
    \break
    
    %bridge
    sol4^\markup { \musicglyph "scripts.segno" } si16 lab lab16. si32 lab16 sol sol fad sol8 lab16. sol32 fad16 sol fad8 |
    sol lab do si8. lab16 lab16. si32 lab16 sol sol16. lab32 sol16 fad mib re |
    
    \mark "تسليم"
    \repeat volta 2
    {
      do8^\markup{ \musicglyph "scripts.coda" } r8 sol' sol4 sol16. lab32 sol16 fa fa8. sol16 mib8 |
      fa sol lab16 sib sol lab fa sol mib fa re mib do mib sol mib do8 |
      do8. lab'16 sol fad sol4 do,16 re mib fad sol8 fad16 mib re do |
      si lab sol lab si do re mib fad sol lab16. sol32 fad16 lab sol fad sol8 \tuplet 3/2 { re16 mib mi } |
      fa4 sol8 fa16 mib re do re8 mib re16 do si lab sol8 |
      si do re si8. do16 si lab lab sol sol8 r4 |
    }
    \break
    
    \mark "II"
    \repeat volta 2
    {
      do'4 si8 do sol16. sol32 \tuplet 3/2 { lab16 sol lab } \tuplet 3/2 { si lab si } do8 r re |
      do4 re16 mib re do do si si16. lab32 sol16 lab si4 do16 lab |
      sol4 re'16 mib re8. do16 si8-2 fad'16-4 mib-1 re8.-1 mib16 re do |
      si8.-3 do16 lab-1 si do8. mib16 re do si lab sol4 r8 |
      re'16. do32 si16 do re do re8. do16 fa4-4 fa16 mib re do si lab-\markup { \italic "D.S. " \tiny \raise #1 \musicglyph "scripts.segno"} |
    }
    \break
    
    \mark "III"
    \repeat volta 2
    {
      sol4 fa'8-4 misb8.-3 fa16-4 re8.-1 mib16-2 do8. re16-1 sisb8-3 |
      do re mib fa \tuplet 3/2 { mib16 re do } fa8 mib16 re re4 r8 |
      re4 sol8-3 sol16. lab32-4 sol16 fa-1 mib-4 re-3 do8-1 re-3 mib-4 sol-3 |
      fa4-1 mib16-4 re-3 re8 do16-0 re-1 mib re do si-3 do8 r re16-1 mib-2 |
      fa4 mib16 re do8 r re mib re16 do si lab si8 |
      do r mib re do si lab sol4 r8-\markup { \italic "D.S. " \tiny \raise #1 \musicglyph "scripts.segno"} |
    }
    \break
    
    \mark \markup { "IV" }
    \time 3/8
    \set Timing.beamExceptions = #'()
    \set Timing.baseMoment = #(ly:make-moment 1/8)
    \set Timing.beatStructure = 1,1,1
    \repeat volta 2
    {
      sol4. |
      do4 si8 |
      re4. |
      re |
      sol, |
      lab4 si8 |
      sol sol16. lab32 sol16 fad |
      mib fad mib re do8 |
      sol'4. |
      do4 re8 |
      mib4. |
      mib8 re do |
      si4 sol8 |
      lab4 si8 |
      sol si re |
      sol,4 r8 |
    }
    \repeat volta 2
    {
      sol'4-4 fa8 |
      misb4 do8 |
      re4. |
      sol |
      do, |
      misb-3 |
      re16 misb fa misb re do |
      sisb do sisb la sol8 |
      sol'4 fa8 |
      misb4 do8 |
      re4. |
      la'-4 |
      sol4-2 fa8-1 |
      misb4-3 re8 |
      do sisb re |
      do4 r8 |
    }
    \repeat volta 2
    {
      do16 si-3 do re-1 mib-2 fa-1 |
      lab-4 sol-3 fa-1 mib-4 re-3 do-0 |
      si-4 lab si do re-1 mib |
      sol-3 fa mib re do-0 si-4 |
      lab sol lab si do re-1 |
      fa mib re do si lab |
      \alternative
      {
        { sol fad sol lab si do | re-2 mib re do re8 |}
        { sol, si re | }
      }
    }
    sol,4 r8 |
    sol4. |
    do4 si8 |
    re4. |
    re |
    sol, |
    lab4 si8 |
    sol sol16. lab32 sol16 fad |
    mib fad mib re do8 |
    sol'4. |
    do4 re8 |
    mib4. |
    mib8 re do |
    mib4.\fermata |
    fad!\fermata |
    sol\fermata-\markup { \italic "al Coda " \raise #1 \musicglyph "scripts.coda" } |
  }
}