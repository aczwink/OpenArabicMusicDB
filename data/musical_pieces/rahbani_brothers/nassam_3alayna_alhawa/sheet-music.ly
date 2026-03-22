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
  title = "نسّم علينا الهوى"
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
	    sol8 la sib la la2 |
	  }
	  
	  do8 re mi do sib do re sib |
	  la sib do sib la4. sol16 la |
	  sib8 la sol fa mi4. fa16 sol |
	  la8 sol fa mi re4. mi16 fa |
	  sol8 fa mi re do sib la sol |
	  la sib do sib la2 |
	}
	
	\repeat volta 2
	{
	  %refrain
	  \repeat percent 2
	  {
	    la'4 sib la sol |
	  }
	  la sib do8 re re do |
	  do sib sib la la2 |
	  la8 sol la sib sol4 fa |
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
	  mi8 fa sol fa fa mi mi re |
	  re mi fa mi mi re re do |
	  do re mi re re do do sib |
	  do4 sib la2 |
	}
	
	mi'4  mi mi re |
	mi re8 do sib4 la |
	fa' fa fa mi |
	sol fa8 mi re do sib la |
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

\language "english"
chordsStaff = \chordmode
{
	\set chordChanges = ##t
	
	%intro
	a1:5.8
	a:5.8
	c2 bf
	g:min a:5.8
	d:5.8 g:min
	bf f
	d:5.8 bf
	g:min a:5.8 a:5.8
	
	%refrain
	a1:5.8
	a:5.8
	c2
	c a:5.8
	d1:5.8
	d:5.8
	c2 bf
	g:min a:5.8
	
	%verse
	a1:5.8
	d2:5.8 g:min
	g:min c
	c f
	d1:5.8
	c
	g:min
	a:5.8
}

\score {
 <<
  \new ChordNames \chordsStaff
  \new Staff \melody
 >>
}