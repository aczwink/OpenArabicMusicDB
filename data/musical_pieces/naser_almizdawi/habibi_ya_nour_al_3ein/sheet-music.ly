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

\header
{
	title = "حبيبي يا نور العين"
	composer = "ناصر المزداوي"
    tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}

melody = \relative sol'
{
	\key sol \hijaz
	\set Staff.extraNatural = ##f
	\time 2/4
	
	%intro	
	\repeat volta 2
	{
		\repeat percent 2 { sol8. lab sol8 }
		\repeat percent 2 { fa8. sol lab8 }
	}
	
	%solo	
	do8. do8 do re16 |
	si8. si8 do16 re mib |
	fa8. fa8 fa sol16 |
	mib8. r sol,8 |
	
	do8. do8 do re16 |
	si8. si8 do16 re mib |
	fa8. fa8 fa sol16 |
	mib8. r r8 |
	
	do8. mib8 re16 do re |
	sib8. r8. r8 |
	
	sib8. re8 do16 sib do |
	lab8. r8. r8 |
	
	r8 lab16 do8 si16 lab si |
	
	\repeat percent 2
	{
	  sol4. lab16 sol |
	  fa8. lab8 lab si16 |
	}
	
	sol2
	
	%verse 1
	\repeat volta 4
	{
	  r8 do16 do8 do si16 |
	  do8 do16 si do si lab sol |
	  fa8. lab8 lab si16 |
	  sol4 sol
	}
	
	%chorus
	\repeat volta 3
	{
	  r8 mib'16 mib8 mib16 re8 |
	  r8 re16 re8 re16 do8 |
	  r8 do16 do8 do re16 |
	  si8 si16 do re8 mib |
	}
	
	r8 mib16 mib8 mib16 re8 |
	r8 re16 re8 re16 do8 |
	r8 do16 do8 do si16 |
	do8 do16 si do si lab sol |
	fa8. lab8 lab si16 |
	sol4 do
	
	%verse 2 and 3
	\repeat volta 2
	{
	  r8. sol8 sol lab16 |
	  sib8 do re4 |
	  do8. mib8 re16 do re |
	  sib2 |
	  sib8. sib8 sib do16 |
	  re do do sib do8 sib |
	  lab8. do8 si16 lab si |
	}
	\repeat percent 2
	{
	  sol4 r |
	  fa8. lab8 lab si16 |
	}
	\repeat percent 2
	{
	  sol4 r |
	  fa8. lab8 lab si16 |
	}
	sol4 r |
	r8 do16 mib8 re do16 |
	si8 do re mib
	
	%outro
	\repeat volta 2
	{
	  sol,8. lab sol8 |
	  r2 |
	  fa8. lab sol8
	  r2 |
	}
	\repeat volta 2
	{
	  r8 mib'16 mib8 mib16 re8 |
	  r8 re16 re8 re16 do8 |
	  r2 |
	  r2 |
	}
}

chordsStaff = \chordmode
{
	\set chordChanges = ##t
	\language "english"
	
	%intro
	sol1
	fa:min
	
	%solo
	do2:min
	sol
	fa:min
	do1:min
	sol2
	fa:min
	do1:min
	sib
	lab
	sol2
	fa1:min
	fa2:min
	
	sol
	
	%verse 1
	do1:min
	fa2:min
	sol
	
	%chorus
	do2:min
	sol
	fa:min
	sol
	
	do:min
	sol
	fa:min
	sol
	
	fa:min
	sol
	
	%verse 2 & 3	
	do8.:min
	sol2.:min
	sol16:min
	
	do2:min	
	sib1.
	lab2
	
	sol
	fa1.:min
	sol2
	fa1.:min
	sol2
	do1:min
	
	%outro
	sol1
	fa:min
}

\score {
 <<
  \new ChordNames \chordsStaff %\transpose sol mi
  \new Staff \melody
 >>
 %\midi{}
}