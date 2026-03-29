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
  title = "نسّم علينا الهوى variations"
  composer = "رحباني brothers"
  tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2026 Amir Czwink" }
}

melody = \relative sol'
{
	\key la \kurd
	\set Staff.extraNatural = ##f
	\time 4/4
	
	%Intro	
	\repeat volta 2
	{
	  \repeat percent 2
	  {
	    \grace { sib16 la } sol8 la sib la la2 |
	  }
	  
	  do8 re mi do sib16 do sib do re8 sib |
	  la16 sib la sib do re sib do la4. sol16 la |
	  sib do la sib sol la fa sol mi4. fa16 sol |
	  la sib sol la fa sol mi fa re4. mi16 fa |
	  sol la fa sol mi fa re mi do re sib do la sib sol8 |
	  la sib do sib la2 |
	}
	
	\repeat volta 2
	{
	  %refrain
	  \grace { la'16 sib } la8 la sib sib16 do la8 la16 sib sol8. sol16 |
	  la sib la la sib do sib do la8 la16 sib sol8 sol16 sol |
	  la sib la la sib do sib sib do8 re16 mi re mi do re |
	  do re sib do sib do la8 la re, fa la |
	  la8 sol la sib sol4\glissando( fa) |
	  sol la fa8 mi re4 |
	  sol8 fa fa mi mi re re do |
	  do sib sib la la2 |
	}
	
	\repeat volta 2
	{
	  la' la4 re, |
	  sib'8 sol la fa sol2 |
	  sol4 sol sol do, |
	  la'8 fa sol mi fa2 |
	  mi8 fa sol16 la sol fa fa sol fa mi mi fa mi re |
	  re8 mi fa16 sol fa mi mi fa mi re re mi re do |
	  do8 re mi16 fa mi re re mi re do do re do sib |
	  sib8 re do sib la2 |
	}
	
	mi'4  mi mi re |
	mi re8 do sib4 la |
	\grace { re16 mi } fa4 fa fa4. mi16 fa |
	sol4 fa16 sol mi fa re mi do re sib do la8 |
	sol'4 sol8 fad sol4 sol8 fad |
	sol4. la8 fa mi re4 |
	la'4 la2. |
	sol2 do |
	sib2. la4 |
	sib la r2 |
	la8 sol sol fa fa mi mi re |
	re do do sib do sib la4 |
	la1 | %TODO: the segno and coda stuff!
}

\score {
 <<
  \new Staff \melody
 >>
}