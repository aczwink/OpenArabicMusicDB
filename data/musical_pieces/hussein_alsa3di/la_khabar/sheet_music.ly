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
	title = "لا خبر"
	composer = "حسين السعدي"
	tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2026 Amir Czwink" }
}

\relative do'
{
	\key fa \rast
	\set Staff.extraNatural = ##f
	
	%intro
	\repeat volta 2
	{
	  \repeat percent 2
	  {
	    r8 lasb'4 fa8 sol4 fa |
	  }
	  r8 sib4 do8 re4 do |
	  sib lasb \tuplet 3/2 { do8 sib lasb } sol4 |
	  \repeat percent 2
	  {
	    r8 sol4 misb8 fa4 misb |
	  }
	  r8 lasb4 sib8 do4 sib |
	  lasb sol \tuplet 3/2 { sib8 lasb sol } fa4 |
	}
	\repeat volta 2
	{
	  fa'2 misb4 fa( |
	  fa8) fa16 sol fa8 mib re do sib4 |
	  mib2 re4 mib( |
	  mib8) mib16 fa mib8 re do sib lasb4 |
	  reb2 do4 reb( |
	  reb8) reb16 mib reb8 do sib lasb sol4 |
	  do2 sib4 do( |
	  do8) do16 re do8 sib lasb sol fa4 |
	}
	\repeat percent 2
	{
	  r8 lasb4 fa8 sol4 fa |
	}
	
	%refrain
	\repeat volta 2
	{
	  <<
	    { r8 }
	    \\
	    { do8 }
	  >>
	  lasb'4 lasb8 fa4 fa |
	  do8 lasb'4 sib8 do4 re( |
	  re8) do4 sib8  lasb4 do( |
	  do8) sib4 lasb8 sol sib lasb4 |
	  sol8 lasb sib lasb sol sol16 lasb sib8 sib16 lasb |
	  sol8 sol4 sol8 misb4 misb |
	  r8 sol4 lasb8( lasb) sib sib4( |
	  sib8) lasb4 sol8( sol) sol lasb sol |
	  \alternative
	  {
	    { fa8 sol lasb sol fa4 fa | }
	    { fa8 sol lasb sol fa4 do'8 re | }
	  }
	}
	\repeat volta 2
	{
	  mib8 mib4 mib8( mib) mib mib4 |
	  r8 mib4 mib8( mib) re re4 |
	  r8 re4 re8( re) re re do |
	  sib do re4 re sib8 do |
	  re re4 re8( re) re mib4 |
	  re8 do4 sib8( sib) sib lasb4 |
	  r8 lasb4 lasb8 sol lasb sib4 |
	  \alternative {
	    { lasb8 sib do4 do do8 re | }
	    { lasb8 sib do4 do r | }
	  }
	}
	\repeat volta 2
	{
	  \time 2/4 %haja3
	  r8 sib re do |
	  sib4 r |
	  r8 sib8 sib re8( |
	  re4) mib4 |
	  re8 do4. |
	  sib8 lasb sib lasb |
	  sol do sib lasb |
	  sol4 r |
	  
	  r8 lasb do sib |
	  lasb4 r |
	  r8 lasb8 lasb sib8 |
	  do4 re8 do |
	  do8 sib4. |
	  lasb sol8 |
	  fa sol lasb sol |
	  fa4 r |
	}
	\repeat volta 2
	{
	  \time 4/4 %maqsum
	  r8 sib4 sib8 sib4 do |
	  r8 lasb4 lasb8( lasb) lasb sib4 |
	  r8 sol4 sol8( sol) do do4 |
	  lasb8 sib lasb sol fa2 |
	}
	
	%verse 1
	\repeat volta 2
	{
	  r8 sib4 sib8( sib) re re4( |
	  re8) re4 re8( re) do sib4( |
	  sib8) re4 do8( do) sib lasb4 |
	  do do8 sib lasb4 r |
	  r lasb8 lasb( lasb) sib do4 |
	  r8 re4 do8( do) sib lasb4 |
	  do sib lasb lasb |
	  sib8 sib lasb4 sol2 |
	}
	\repeat volta 2
	{
	  r8 sib4 sib8 sib4 re( |
	  re8) re4 do8 sib4 sib8 sib |
	  re4 re8 do do4 sib8 sib |
	  re4 re8 do do4 r |
	}
	r8 re4 re8( re) do sib4 |
	r8 lasb4 do8( do) sib lasb4 |
	sib sib lasb2 |
	r8 sib4 sib8( sib) lasb sib4( |
	sib8) sib4 lasb8 sol4 fa |
	sol lasb8 sol fa4 r |
	
	%verse 2
	\repeat volta 2
	{
	  r8 sib4 sib8( sib) re re4( |
	  re8) re4 re8( re) do sib4( |
	  sib8) re4 do8( do) sib lasb4 |
	  do do8 sib lasb4 r |
	  r lasb8 lasb( lasb) sib do4 |
	  r8 re4 do8( do) sib lasb4 |
	  do sib lasb lasb |
	  sib8 sib lasb4 sol2 |
	}
	\repeat volta 2
	{
	  r8 sib4 sib8( sib) sib re4( |
	  re8) re4 re8( re) do sib4 |
	  r8 sib4 sib8( sib) sib sib4 |
	  re4 re8 do do4 sib8 sib |
	  re4 re8 do do4 r |
	}
	r8 re4 do8( do) sib lasb4 |
	do sib lasb2 |
	r8 do4 sib8( sib) lasb sol4 |
	sib lasb lasb sol |
	r8 sib4 sib8( sib) lasb sib4( |
	sib8) lasb4 lasb8( lasb) sol lasb4 |
	r8 lasb4 lasb8( lasb) sol lasb4 |
	sol lasb8 sol lasb sol fa4 |
}