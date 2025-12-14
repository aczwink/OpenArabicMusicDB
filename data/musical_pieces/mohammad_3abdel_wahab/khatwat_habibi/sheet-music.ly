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

#(set-global-staff-size 21)

\header
{
  title = "خطوة حبيبي"
  composer = "محمد عبد الوهاب"
  tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}

\relative re'
{
  \key sol \minor
  \time 2/4
  \set Staff.extraNatural = ##f
  
  \mark "(1)"  
  r8 re'16 re re8 dod |
  re sib la4 |
  sold8 la( la) sib |
  dod re mib re |
  r mib16 mib mib8 re |
  re dod dod sib |
  r mib16 mib mib8 re |
  re dod mib re |
  r sol,16 la sol8 la |
  
  \repeat volta 2
  {
    \segnoMark 1
    sib sol sib16 la sol fad |
    mib8 fad16 sol fad8 sol |
    la fad la16 sol fad mib |
  }
  \alternative {
    { re8 sol16 la sol8 la | }
    { re, do16 re do8 re | }
  }
  \repeat volta 2
  {
    mib do sol'16 fad sol8 |
    mib fad16 mib fad8 re |
    mib do mib re |
  }
  \alternative {
    { r do16 re do8 re | }
    {}
  }
  \break
  
  \mark "(2)"
  r re'16 re re8 misb |
  re do sisb la |
  sisb do re misb |
  re do sisb8. la16 |
  sol8 fa'4 misb8 |
  misb re re4( |
  do8) do4 sisb8 |
  sisb sisb32( la sisb do) re8 sisb |
  la16 sol sol la sol8 la-\markup { \italic "D.S. " \tiny \raise #1 \musicglyph "scripts.segno"} |
  \break
  
  \mark "(3)"
  r re16\staccato re\staccato re8\staccato re\staccato |
  \repeat volta 2
  {
    mib16 mib8\staccato mib16 re re8\staccato re16 |
    do do8\staccato do16 re re8\staccato re16 |
    mib mib8\staccato mib16\staccato( mib) re8\staccato do16 |
    re8\staccato sib16\staccato sib\staccato sib8\staccato sib\staccato |
    do16 do8\staccato do16 sib sib8\staccato sib16 |
    la la8\staccato la16 sib sib8\staccato sib16 |
    do do8\staccato re16\staccato( re) sib8\staccato la16 |
  }
  \alternative {
    { do8 re16\staccato re\staccato re8\staccato re\staccato | }
    {
      la sol16 la sol8 la-\markup { \italic "D.S. " \tiny \raise #1 \musicglyph "scripts.segno"} |
    }
  }
  \break
  
  \mark "(4)"  
  re4\staccato do8 sib |
  sib4 la8 sol |
  sol4 fad8 sol |
  la re,16 re re8 re |
  re'4\staccato do8 sib |
  sib4 la8 sol |
  sol4 fad8 sol |
  la re, mib fad |
  sol re' do sib |
  \repeat volta 2
  {
    la sib do re |
    mib4 re |
    \tuplet 3/2 { mib,8( re mib) } re4 |
    r8 re' do sib |
    la sol fad sol |
    la16 sib do sib la8 do,16 sib |
    la8 do'16 sib la8 do,16 sib |
    la8 sib' la sol |
    la sib4 la8( |
    la) sol4 fa8 |
    fa4. mib8 |
    re re mib fa |
    sol la r fa |
    mib4 re8 la'16 la |
    
  }
  \alternative {
    {
      la8 la la la |
      re re do sib |
    }
    { la8 la la la | }
  }
  re re16 re re8 misb |
  re do sisb la |
  sisb do re misb |
  re do sisb8. la16 |
  sol8 fa'4 misb8 |
  sol16-> misb re fa-> re do misb-> do |
  sisb re-> do re-> sisb la do-> sisb |
  do-> la sisb do re sisb do16. sisb32 |
  la8 sol16 la sol8 la-\markup { \italic "D.S. " \tiny \raise #1 \musicglyph "scripts.segno"} |
  \break
  
  \mark "(5)"
  la r16 la32 la la16 la la la |
  re8 r r4 \bar "|."
}