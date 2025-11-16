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
\version "2.24.0"
\include "arabic.ly"

\header
{
	title = "Leyla ليلى"
	tagline = ""
	tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}

#(set-global-staff-size 21)

\score
{
  \relative do'
  {
	  %\key re \hijaz
	  \key sol \minor
	  \set Staff.extraNatural = ##f
	  \time 4/4
	  \set Timing.beamExceptions = #'()
	  \set Timing.baseMoment = #(ly:make-moment 1/4)
	  \set Timing.beatStructure = 1,1,1,1
	  \numericTimeSignature
	  
	  \repeat volta 2
	  {
	    \omit Score.BarLine
	    re2. re16 mib fad sol
	    la2 sib8 la sol fad
	    sol la sib do sib la r4
	    la16 sib la sol la2.
	    sib8 la sol fad sol la sib do
	    sib la r4 la16 sib la sol la4(
	    la2.) re,8 mib
	    fad sol2. sol8
	    fad mib re do re mib fad4
	    sol2 sol8 fad mib re |
	    \undo \omit Score.BarLine
	    do re mib fad( fad2) |
	    sol8 fad mib re do re mib fad!(
	    fad4) sol la sib do8 sib la sol fad mib re do
	    re1 |
	  }
	  \break
	  
	  \time 2/4
	  \mark \markup { \musicglyph #"scripts.segno" }
	  \repeat volta 2
	  {
	    r8 la'16 la la8 sib |
	    la sol fad sol |
	    la sib16 do sib8 la |
	    la16 sol fad sol la4 |
	    r8 sol16 sol sol8 la |
	    sol fad mib fad! |
	    sol la16 sib la8 sol |
	    sol16 fad mib fad sol4 |
	  }
	  \repeat volta 2
	  {
	    sib8. la16 sib8 do |
	    r sib, la sol |
	    la'8. sol16 la8 sib |
	    r la, sol fad |
	  }
	  \repeat volta 2
	  {
	    sol' fad16 sol la8 sol16 la |
	    sib8 la16 sib do8 sib16 do |
	    re8. do16 sib8. la16 |
	    sol8. fad16 mib8. re16
	  }
	  
	  dod'4\mordent
	  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
	  \mark "Ende"
	  re16\staccato
	  \hideNotes
	  r8 r16 |
	  \unHideNotes
	  \break
	  
	  \repeat percent 3
	  {
	    do,8 re16 re( re) re re8 |
	    sib16 la sib do re4 |
	  }
	  \hideNotes
	  r16^\markup{ Taksim } r r r r r r r |
	  \unHideNotes
	  
	  \time 4/4
	  \set Timing.beamExceptions = #'()
	  \set Timing.baseMoment = #(ly:make-moment 1/4)
	  \set Timing.beatStructure = 1,1,1,1
	  
	  \repeat percent 2
	  {
	    r8 re mib4 re dod' |
	    r8 re, fad sol re4 dod' |
	  }
	  
	  r8 re, mib4 re sol |
	  r8 re mib4 re la'8 re, |
	  r8 la' sib8. do16 re8. do16 sib8. la16 |
	  sol8 sib re4. sib8 sib8. la16 |
	  sol8 la16 sib do4. la8 la8. sol16 |
	  fad8 sol16 la sib4. sol8 sol fad!16 mib |
	  re8 sib' re4. sib8 sib8. la16 |
	  sol8 la16 sib do4. la8 la8. sol16 |
	  fad8 sol sib4 sib8 sib16 sib sib8 sib16 sib |
	  
	  \time 2/4
	  \repeat volta 2
	  {
	    sib8 sib16 sib sib8 re( |
	    re) re16 do re8 sib |
	    sib sib16 sib sib8 do |
	    r16 do8 sib16 sib la sol8 |
	  }
	  re'8. do16 sib8. la16 |
	  sol8. fad16 mib8. re16 |
	  \bar "|."
	  
	  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
	  \mark \markup { \musicglyph #"scripts.segno" }
  }
  %\midi {}
}