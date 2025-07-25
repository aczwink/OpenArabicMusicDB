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

#(set-global-staff-size 26)

\header
{
	title = "دولاب بياتي"
	composer = ""
    tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}

\relative re'
{
	\key re \bayati
	\set Staff.extraNatural = ##f
	
	\repeat volta 2
	{	
	  \repeat unfold 2
	  {	
	    sol8 sol4 sib8 la4 sol |
	    fa8 sol sol fa misb re do4 |
	    \alternative
	    {
	      {
	        re misb fa sol |
	        la8 sol fa la sol2 |
	      }
	      {
	        la8 sol sol fa fa misb misb re |
	      }
	    }
	  }
	  
	  \break	  
	  \alternative
	  {
	    \volta 1 { re4. do8 sib la sol4 | }
	    \volta 2 {
	      do2 sol' |
	    }
	  }
	}
	
	fa4. misb8 misb8. fa16 misb8 re |
    re4 misb8 fa sol4 sol |
    sol8. fa32 misb re8 misb fa re misb do |
    re1 |
}