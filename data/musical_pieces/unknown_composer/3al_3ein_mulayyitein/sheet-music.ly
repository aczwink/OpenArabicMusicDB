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
	title = "ع العين موليتين"
	composer = "فولكلور"
    tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}
  
melody = \relative re'
{
	\key re \bayati
	\set Staff.extraNatural = ##f
	
	\repeat volta 2
	{	
		\repeat volta 2
		{
			\repeat volta 2
			{
				\repeat unfold 4 { fa'16 re misb8 } |
				\repeat unfold 4 { misb16 do re8 } |
			}
			re,16 re misb re fa re sol re la' re, sisb' re, do' re, re'8 |
		}
		r8 re,4 re'8 re,4 re'8. re16( |
		re8) re,4 re'8 re,4 re'4 |
	}
	
	\repeat volta 2
	{
		re,8 la'4 la8 sol8 sol fa4 |
		misb8 sol4 fa8 misb8. re16 misb4 |
		misb16 fa sol8 sol la fa sol misb4 |
		re16 misb fa4 fa8 misb4 re |
	}
	
	\repeat volta 2
	{
		\repeat percent 2 { la'16 sib la8 sol16 la sol8 fa4 sol } |
		sol16 la sol8 fa16 sol fa8 misb4 fa |
		sol16 la sol8 fa16 sol fa8 misb4 re |
	}
}

chordsStaff = \chordmode
{
	\set chordChanges = ##t
	\language "english"
	re1:min
	do:1.5.8
	
	re:min
	
	re:min
	re:min
	
	re:min
	do:1.5.8
	do:1.5.8
	do2.:1.5.8
	re4:min
	
	sol1:min
	sol:min
	fa
	re:min
}

\score {
 <<
  \new ChordNames \chordsStaff
  \new Staff \melody
 >>
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
			\line { ع العين موليتين واتناش مولية }
			\right-align
			\line { جسر الحديد انقطع من دوس رجليا }
			\right-align
			\line { مشوار مشيته الصبح ومشيته عصريه }
			\right-align
			\line { يااحباب لاترحلوا ضلوا حواليا }
			
			\right-align
			\line { \null }
			
			\right-align
			\line { أهلا و سهلا و مرحبتين باللي جن }
			\right-align
			\line { لقعود ورش الورد للسمر لما جن }
			\right-align
			\line { نوبة يقولون انصدع و نوبة يقولون انجن }
			\right-align
			\line { و نوبة يقولون صابته بالراس جنيه }
						
			\right-align
			\line { \null }
			
			\right-align
			\line { ياريم تلحقتلك من فوق الجبال }
			\right-align
			\line { والعين سودچ حلا من جر الميالي }
			\right-align
			\line { ماريد منه شغل بس يقعد اقبالي }
			\right-align
			\line { باديني اجيبه له الخبز واجيبه له الميه }
			
			\right-align
			\line { \null }
			
			\right-align
			\line { لو ترحمه بس تجي من العين تسقيني }
			\right-align
			\line { چان القلب يرتوي وهمي تنسيني }
			\right-align
			\line { صياد أنا چنت وشلون صابوني }
			\right-align
			\line { والعين سودچ حلا والشفة وردية }
		}
		\hspace #20
	}
}