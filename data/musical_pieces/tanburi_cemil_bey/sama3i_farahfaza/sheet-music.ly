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
	title = "سماعي فرحفزا"
	composer = "Tanburi Cemil Bey"
  tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}

#(set-global-staff-size 23)

\score {
  \header {
    piece = ""
  }
  \new Staff \relative sol'
  {
    \set Staff.extraNatural = ##f
    \key sol \minor
    \time 10/8
    
    \set Timing.beamExceptions = #'()
    \set Timing.baseMoment = #(ly:make-moment 1/8)
    \set Timing.beatStructure = 2,1,2,2,2,1
    
    \mark "I"
    sib4 fa8 sol16 la sol8 la16 sib la do sib4 r8 |
    sib4 re8 do16. sib32 do16 re sib16. la32 sib16 do la4 sib16 la |
    sol4 la8 sol la sol16 la sol fa sol8[ la sib] |
    re16 do sib la sol8 fa8. mi16 la8 sol16 fa fa4 sol16 la |
    sib4 la16 sol sol4 sol16 la sol fa la4 sol16 fa |
    fa4 mi8 fa8. mi16 fa8 sol sib16 la sol fa mi fa |
    re4 sol8 fa8. lab16 sol8 fa mib16 fa mib re do8 |
    mib4 mib8 mib16 re do8 re16. fa32 mib16 re re4 r8 |
    \break
    
    \mark "تسليم"
    \repeat volta 2
    {
      mib4^\markup{ \musicglyph "scripts.segno" } mib8 mib16 re do8 re mib fa sol sol16 fa |
      sol fa mib re do re mib16. re32 mib16 fa re16. do32 re16 mib do8. mib16 re do |
      sib4 la16 sib do8. mib16 re8 do sib[ la sol] |
      \alternative
      {
        { la[ sib do] sib16 la sol8 sib16 la sol fad sol la sib do re fa | }
        { la,8[ sib do] sib16 la sol8 sib16 la sol fad sol4 r8 | }
      }
    }
    \break
    
    \mark "II"
    sol'4 la16 do sib16. la32 sol16 la sol16. fad32 mi16 fad sol4 r8 |
    sol4 re'8 do8. mib16 re8 do sib16 do sib la sol8 |
    sol4 la16 do sib16. la32 sol16 la sol16. fad32 mi16 fad sol4 r8 |
    sol4 re'8 re8. do16 re do sib la sib4 r8 |
    fa4 sib16 la sib4 sib16 do sib la re8[ do sib] |
    la4 la16 sol sol do sib la sol fa misb sol fa sol fa8 misb |
    sol16 fa misb fa sol8 sol16 lab sol fa sol lab si do mib re do si lab sol |
    fa4 mi8 mib8. re16 re fa mib re re4 r8-\markup { \italic "D.S. " \tiny \raise #1 \musicglyph "scripts.segno"} |
    \break
    
    \mark "III"
    mib'16 re dod re mib fad re4 r8 sib16 la sol4 fad16 sol |
    la4 sol16 la sib8 la16 sib dod8 sib16 dod re4 r8 |
    mib16 re dod re mib fad sol4 sol8 fad16 mib fad4 mib16 re |
    mib4 re8 la'16 sol sol fad fad mib mib re re4 r8 |
    re[ mi fa] mi fa re mib re8. dod16 sib8 |
    dod16 re dod re sib8 mib16 re re dod sib16. la32 sol16 sib la4 r8 |
    re,4 mib8 fad sol la sib re16 dod sib la sol8 |
    fad4 mib16 re la' sol sol fad fad mib mib re re4 r8-\markup { \italic "D.S. " \tiny \raise #1 \musicglyph "scripts.segno"} |
    \break
    
    \mark \markup { "IV" }
    \time 6/8
    \set Timing.beamExceptions = #'()
    \set Timing.baseMoment = #(ly:make-moment 1/8)
    \set Timing.beatStructure = 3,3
    re4. sol4 la8 |
    sib4. sib8 la sol |
    fad4. sol4 sold8 |
    la4.( la4) r8 |
    re,4. mib4 re8 |
    sol4. sol8 fa mib |
    re re16 do re mib do8 do16 sib do re |
    sib8 sib16 la sib do re do sib la sol8 |
    re'4. sol4 la8 |
    sib4. sib8 la sol |
    fad4. sol4 sold8 |
    la4.( la4) r8 |
    la8 la16 sol la sib do8 do16 sib do la |
    sib8 sib16 la sib do re8 re16 mib re do |
    sib8 sib16 la sib do la8 la16 sol la sib |
    sol4.( sol4) r8 |
    
    \repeat volta 2
    {
      mib'16 re dod re mib re dod re mib re dod re |
      sol4.( sol) |
      re16 do si do re do si do re do si do |
      fa4.( fa) |
      do16 sib la sib do sib la sib do sib la sib |
      re4 do8 sib la sol |
      \alternative
      {
        {
          fa sol la sib dod mib |
          re4.( re) |
        }
        {
          fa,4.\fermata^\markup \italic \translate #'(3.7 . 0) "rit."
          mib\fermata |
          re2.\fermata-\markup { \italic "D.S. " \tiny \raise #1 \musicglyph "scripts.segno"} |
        }
      }
    }
  }
}