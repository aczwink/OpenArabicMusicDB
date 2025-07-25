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

#(set-global-staff-size 30)

\header
{
	title = "يا ذا القوام السمهري"
	composer = ""
    tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}

\relative re'
{
	\key la \kurd
	\set Staff.extraNatural = ##f
	\override Score.CodaMark.font-size = #4
	\override Score.SegnoMark.font-size = #4
	\set Score.finalFineTextVisibility = ##t
	\time 4/4
	
	\repeat volta 2
	{
	  r8 la'4 sib8 dod la sib sold |
	  la8. sib16 la8 sold fa mi re fa16 sold |
	  la8 la4 sib8 dod la sib sold |
	  
	  \alternative
	  {
	    { la8. sold16 fa8. mi16 re8. dod16 sib8 la | }
	    { la'8. sold16 fa8 sold la16 sib la sold la4 | }
	  }
	}
	
	\repeat volta 2
	{
	  mi4 fa8 mi re4 la' |
	  sol8 sib la sol fa mi re4 |
	  do8 re4 do8 do sib sib la |
	  
	  \alternative
	  {
	    { la sib do re mi16 fa mi re mi4 | }
	    { la,8 r8 r8 sol la sol la4 | }
	  }
	}
	
	\repeat volta 2
	{
	  r4 la' sib dod |
	  re4. mi8 re dod sib la |
	  la4 la sib dod |
	  re8. do16 sib8 dod re dod re4 |
	  r4 sol,4 la sisb |
	  do2 sisb4 la |
	  sisb4. do4 sisb la8 |
	  la sisb do sisb la4 r-\markup {\italic "da capo"} |
	}
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
			\line { يا ذا القوام السمهري }
			\right-align
			\line { حاوي الرضاب السكري }
			\right-align
			\line { \null }
			\right-align
			\line { عن ثغرك الزاهي اللمى }
			\right-align
			\line { يروى صحاح الجوهري }
		}
		\hspace #2
		\column
		{
			\right-align
			\line { كم ذا التجافي و البعاد }
			\right-align
			\line { أحرمت أجفاني الرقاد }
			\right-align
			\line { \null }
			\right-align
			\line { بادر و جود و ارعى الوداد }
			\right-align
			\line { يا ذا الجبين الأنور }
		}
		\hspace #1
	}
}