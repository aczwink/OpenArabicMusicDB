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
	title = "عرفت قلبي مولع فيك"
	composer = "فولكلور حمصي"
	tagline = "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink"
}

\relative do'
{
	\key do \rast
	\set Staff.extraNatural = ##f
	
	%verse 1
	\repeat volta 2
	{	
		<<
			{ r8 sol' sol sol la4 sol }
			\\
			{ do,8 }
		>>
		fa4 la8 sol sol4. sol8
	}
	\alternative
	{
		{ fa4 la8 sol sol8 re16 misb fa8 misb16 re }
		{ fa4 la8 sol sol8 re16 misb fa4 }
	}
	r8 fa fa fa fa misb4 misb8
	fa4 sol8 fa fa misb re misb
	fa misb re do do4
	misb8 re fa misb re do do4 sol'8 lab
	
	%chorus
	\mark \markup { \musicglyph #"scripts.segno" }
	\repeat volta 2
	{
		si4 lab8 sol lab sol sol4 |
		fa sol sol sol8 lab |
		si4 lab8 sol lab sol sol4 |
	}
	\alternative
	{
		{ fa sol sol4 sol8 lab }
		{ fa4 sol sol4 re'8 do }
	}
	si lab si4 do8 si lab sol |
	fa4 sol sol sol8 lab |
	si4 lab8 sol lab sol sol4 |
	fa4 sol sol sol |
	
	\repeat percent 2
	{
		fa8 sol4 la8 sol fa fa misb
		misb fa4 sol8 fa misb misb re
	}
	re misb4 fa8 misb re do4
	fa8. misb16 re4 misb8. re16 do4
	\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
	\mark "fine"
	
	%verse 2	 & 3
	\repeat volta 2
	{
	    <<
	      { r8 do' do si do4. re8 | }
	      \\
	      { sol,8 }
	     >>
		do8 si4 lab8 si4. do8 |
		si8 lab4 sol8 lab sol fa4 |
		si8 sol lab fa sol4. misb8 |
		\time 2/4
		fa4. misb8 sol4. fa8 |
		lab4. sol8 si sol lab fa |
	}
	\alternative
	{
		{ sol4 do |}
		{ \time 4/4 sol2 fa4 fa8 sol |}
	}
	
	\repeat volta 2
	{
	  la sol fa misb fa8. misb16 re8 misb |
	  re8 do fa8. misb16 re4 misb8 fa |
	  sol fa misb re misb8. re16 do8 do |
	}
	\alternative
	{
	  { do8 sisb re do do4 fa8 sol | }
	  { do, do sol'4 sol sol8 lab }
	}
	
	\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
	\mark "D.S. al fine" |
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
			\line { عرفت قلبي مولع فيك }
			\right-align
			\line { قسيت قلبك آه }
			\right-align
			\line { راح بدعي عليك }
			\right-align
			\line { ﷲ يخليك }
			\right-align
			\line { للي يحبك }
			
			\right-align
			\line { \null }
			
			\right-align
			\line { ويعذب قلبك }
			\right-align
			\line { يا قاسي }
			\right-align
			\line { زيّ ما تعذبني }
			\right-align
			\line { يا قاسي }
			\right-align
			\line { آه }
			\right-align
			\line { عرفت قلبي }
			\right-align
			\line { مولع فيك }			
		}
		\hspace #2
		\column
		{
			\right-align
			\line { عرفت قلبي وقسيت عليه }
			\right-align
			\line { ليه كان ع ذابي }
			\right-align
			\line { عندك حلال }
			\right-align
			\line { لو كان شايفني مايل لغيرك }
			\right-align
			\line { حقك تزيد }
			\right-align
			\line { عليها دلال }
			
			\right-align
			\line { \null }
			
			\right-align
			\line { آه }
			\right-align
			\line { راح بدعي عليك }
			\right-align
			\line { يا قاسي }
			\right-align
			\line { ﷲ يخليك }
			\right-align
			\line { للي يحبك }
			
			\right-align
			\line { \null }
			
			\right-align
			\line { يللي رضيت هجراني وبعدي }
			\right-align
			\line { حايجيني يوم }
			\right-align
			\line { وأتحكم فيك }
			\right-align
			\line { لو كنت ترحم قلبي وسوهدي }
			\right-align
			\line { هنيني يوم }
			\right-align
			\line { وأنا بهنيك }
		}
		\hspace #1
	}
}
