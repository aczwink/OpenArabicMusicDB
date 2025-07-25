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
	title = "في الروض انا شفت الجميل (خانة)"
	composer = ""
    tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}

\relative re'
{
	\key la \bayati
	\set Staff.extraNatural = ##f
	\override Score.CodaMark.font-size = #4
	\override Score.SegnoMark.font-size = #4
	\set Score.finalFineTextVisibility = ##t
	\time 5/4
	
	\repeat volta 2
	{	
	  la'2 sisb8 do re4 do8 sisb |
	  la4 r re2.( |
	  re1 re4) |
	  do8 re mi re re do do sisb re do |
	  do1( do4) |
	  sisb8 do re do do sisb sisb la do sisb |
	  sisb1( sisb4) |
	  la8 sisb do sisb sisb la la sol sisb la |
	  la1( la4) |
	  sisb2 do2 do8 sisb |
	  la4 sisb do8 re do re re4 |
	}
	\repeat segno 2
	{
	  la2 sisb8 do re4 do8 sisb |
	  \repeat volta 2
	  {
	    la4 r mi'8 re re4 do |
	    re la mi'8 re re do do sisb |
	    do4 sol re'8 do do sisb sisb la |
	    sisb4 sol re'8 do do sisb sisb la |
	  }
	  la1( la4) |
	  sisb2 do2 do8 sisb |
	  la4 sisb do8 re do re re4 |
	}
	
	re,2 sol4 fasd sol |
	la sisb do re mi8 re |
	re do do sisb sisb la la4 sol |
	re'8 do do sisb do sisb sisb la la4 |
	la8 sisb do sisb la2. |
}

\markup
{
	\override #'(text-direction . -1)
	\huge
	\fill-line
	{
		\hspace #1
		\column
		{
		  \right-align
		  \line { في الروض أنا شفت الجميل }
		  \right-align
		  \line { كالغصن يزهو في النسيمْ  }
		  \right-align
		  \line { مكتوب على خدّه الأسيـل }
		  \right-align
		  \line { الورد خلاقـه عظيـمْ  }
		}
		\hspace #3
		\column
		{
		  \right-align
		  \line { نرجس عيونـك يا غزال }
		  
		  \right-align
		  \line { مـن لحظهـم قلبي يهيـمْ  }
		  \right-align
		  \line { والياسمين الخـد قال }
		  \right-align
		  \line { الورد خلاّقُـه عظيـمْ }
		}
		\hspace #3
		\column
		{
		  \right-align
		  \line { لمّـا خطر نور العيون }
		  \right-align
		  \line { فقلت ربـي يـا كريمْ }
		  \right-align
		  \line { صاح الحمام فوق الغصون }
		  \right-align
		  \line { الورد خلاّقُـه عظيـمْ }
		}
		\hspace #1
	}
}