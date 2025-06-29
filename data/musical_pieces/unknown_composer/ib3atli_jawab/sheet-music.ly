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

#(set-global-staff-size 22)

\header
{
	title = "ابعث لي جواب"
	composer = ""
    tagline = "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink"
}

\relative re'
{
	\key re \bayati
	\set Staff.extraNatural = ##f
	\override Score.CodaMark.font-size = #4
	\override Score.SegnoMark.font-size = #4
	\set Score.finalFineTextVisibility = ##t
	
	%verse1
	\repeat volta 2
	{
	  <<
	    { sib'4\rest }
	    \\
	    { re,8 }
	  >>
	  sol8 fa fa misb misb re |
	  re2 misb |
	  fa4. sol8 fa4 sol8 misb |
	  re4 sol8 misb fa re misb do |
	}
	
	%refrain
	\segnoMark 1
	\repeat volta 2
	{
	  <<
	    { re4 }
	    \\
	    { fa4 }
	  >>
	  sol8 fa fa misb misb re |
	  sol2 do,8 re misb fa |
	  sol4 sol8 fa fa misb re fa |
	  fa2 sisb,8 do re misb |
	}
	
	fa4 sol8 fa fa misb misb re |
	re4. re8 misb4. misb8 |
	fa4. sol8-\markup{
	    \italic "al Coda"
	    \tiny \raise #1
	    \musicglyph "scripts.coda"
	  } fa4 sol8 misb |
	
	%interlude
	\codaMark 1
	\repeat volta 2
	{
	  re4 la':8 la la |
	  sol2 la8 sib la sol |
	  fa2 sol8 la sol fa |
	  misb4. sol8 fa4 sol8 misb |
	  
	  re4 sol:8 sol sol |
	  fa2 sol8 la sol fa |
	  misb2 fa8 sol fa misb |
	  re4. misb16 fa sol8 fa misb re |
	  do4. re8 do re do re |
	  misb2 fa |
	  sol misb |
	  fa re4. misb8 |
	  do4. fa4 misb8 re misb |
	}
	
	%verse 2
	\repeat volta 2
	{
	  \alternative
	  {
	    { re8 fa16 sol la8 la la4 la |}
	    { re,4 r8 la' la4 la | }
	  }
	  sib8 la sol fa sol4 la8 sol |
	  fa misb re misb fa4 sol |
	  lab fa8 misb sol fa misb re |
	  re4 sol8 misb fa re misb do |
	  \alternative
	  {
	    {
	      re4 sol8 misb fa re misb do |
	    }
	    {
	      re4 sol8 misb fa re sol la |
	    }
	  }
	}
	\repeat volta 2
	{
	  <<
	    { sib4 }
	    \\
	    { sol4 }
	  >>
	  sib4 sib fa8 sib( |
	  sib8) sib4 la8 sib4 do8 sib |
	  la4 la8 la la4 re,8 la'( |
	  la) la4 sol8 la la sib la
	}
	sol4 do8 sisb sisb la la sol |
	sol4. fasd8 mi fasd sol4 |
	sol4 sol8 sol sisb4 do8 do |
	re4 r8 fa, sol fa misb4
	\repeat volta 2
	{
	  <<
	    { sol4 }
	    \\
	    { re4 }
	  >>
	  sib'4 sib fa8 sib( |
	  sib8) sib4 la8 sib4 do8 sib |
	  la4 la8 la la4 re,8 la'( |
	  la) la4 sol8 la la sib la
	}
	
	sol4 sib8 la la sol sol fa |
	sib4 la8 sol fa mib re do |
	sib4 r8 sib' la sol sol fa |
	la2 re,8 misb fa sol |
	la4 sib8 la la sol sol fa |
	r8 sib4 la8 la sol sol fa |
	r la4 sol8 sol fa fa misb |
	r sol4 fa8 fa misb misb re |
	re4. sol8 fa4-\markup {
	  \italic "D.S. "
	  \tiny \raise #1
	  \musicglyph "scripts.segno"
	} sol8 misb |
	
	%3rd verse
	\codaMark 1
	\repeat volta 2
	{
	  <<
	    { sol4 }
	    \\
	    { re4 }
	  >>
	  r8 si' lab sol sol fa |
	  sol1( |
	  sol4) si lab fa8 fa |
	  sol4 misb fa misb8 fa |
	  sol4 si8 lab lab4 fa8 fa |
	  sol1( |
	  sol4) si8 lab lab4 fa8 fa |
	  sol4 misb fa misb8 fa |
	}
	sol4  r8 si lab4 sol8 sol |
	re' do si do si lab si lab |
	sol lab sol fa \tuplet 3/2 { sol fa misb } \tuplet 3/2 { sol fa misb } |
	re4 r8 si' lab4 fa8 fa |
	sol1( |
	sol4) si8 lab lab4 fa8 fa |
	sol1( |
	sol4) si8 lab lab4 fa8 fa |
	
	sol4 misb fa misb8 fa |
	\repeat volta 2
	{
	  <<
	    { sib4 }
	    \\
	    { sol4 }
	  >>
	  r8 fa fa sol4 lab8 |
	  si4 do8 si lab4 sol |
	  do1( |
	  do4) r8 si4 re8 do si |
	  si lab lab sol sol fa misb re |
	  si'1(
	}
	si4) r8 si do4 lab8 sol |
	fa4 lab8 sol si4 sol8 fa |
	misb4 sol8 fa la4 fa8 misb |
	re sib'4 la8 la sol sol fa |
	r la4 sol8 sol fa fa misb |
	r sol4 fa8 fa misb misb re |
	re4. sol8 fa4-\markup {
	  \italic "D.S. "
	  \tiny \raise #1
	  \musicglyph "scripts.segno"
	} sol8 misb |
	
	%4rd verse
	\codaMark 1
	\repeat volta 2
	{
	  sol4 do8 sisb sisb la la sol |
	  sol2 la |
	  sisb do8 sisb la sol |
	  sol4 re mi fasd |
	  \alternative
	  {
	    \volta 1,3 { sol2. \tuplet 3/2 { fasd8 sol la } }
	    \volta 2,4 { sol4 fa8 mi re do sisb la }
	  }
	}
	sol4 do' do sol8 sol
	\repeat volta 2
	{
	  \repeat volta 2
	  {
	    do4. sisb8 do4 re8 do |
	    sisb4 r8 la8 sisb do sisb la |
	    sisb do sisb la sisb sisb do sisb |
	    \alternative
	    {
	      { la sol sol sol do4 sol8 sol }
	      { la sol re'4 re re8 mi }
	    }
	  }
	  re4 r8 re re4 mi |
	  mi r8 mi fasd sol mi fasd |
	  sol1( |
	  sol1 |
	  sol4) r8 do,16 do do8 sisb sisb8. la16 |
	  sol4 sol8 sol do4 sol8 sol
	}
	do4. sisb8 do4 re8 do |
	sisb4 r8 la sisb do sisb la |
	sisb do sisb la sisb sisb do sisb |
	la sol re' do sib la sol re' |
	re4 do8 sib la sol fa misb |
	re4 r8 do' sib la sol do |
	do4 sib8 la sol fa misb re |
	do4 r8 sib' la sol sol fa( |
	fa) sib4 la8 la sol sol fa |
	r la4 sol8 sol fa fa misb |
	r sol4 fa8 fa misb misb re |
	re4. sol8 fa4-\markup {
	  \italic "D.S. "
	  \tiny \raise #1
	  \musicglyph "scripts.segno"
	} sol8 misb |
	
	%fine
	\codaMark 1
	re4 r2. \fine
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
			\line { ابعتلي جواب وطمني }
			\right-align
			\line { ولو إنه عتاب لا تحرمني }
			\right-align
			\line { \null }
			\right-align
			\line { ابعتلي جواب وطمني }
			\right-align
			\line { \null }
			
			\right-align
			\line { غيابك طال وبستنا }
			
			\right-align
			\line { وقلبك مال تتهنى }
			\right-align
			\line { إن كنت هويت ونسيتني }
			\right-align
			\line { وعلي جنيت ما رعيتني }		
		}
		\hspace #2
		\column
		{
			\right-align
			\line { صبرت عليك وذقت مرار }
			\right-align
			\line { وبعتٌ إليك اخبار واخبار }
			\right-align
			\line { اتاريك نسيتني مع الايام }
			\right-align
			\line { ورضيت تفوتني على الألام }
			\right-align
			\line { \null }
			\right-align
			\line { انا ليه الله يعرفني }
			
			\right-align
			\line { من حر الآه ينصفني }
			
			\right-align
			\line { موش قادر اقول انت الجاني }
			\right-align
			\line { حاصبر على طول على احزاني }
		}
		\hspace #1
	}
}