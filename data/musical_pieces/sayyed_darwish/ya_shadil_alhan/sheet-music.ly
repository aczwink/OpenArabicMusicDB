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

#(set-global-staff-size 29)

\header
{
	title = "يا شادي الألحان"
	composer = "سيد درويش"
    tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}

\relative do'
{
	\key do \rast
	\set Staff.extraNatural = ##f
	\time 8/4
	
	do' do do sisb8 la sol2 la |
	sisb8 do la sisb do4 re r8 re4 do8 re do do sisb |
	do sisb sisb la la4 sisb8 la sol4 sol8 la sib la sib la |
	do sib la sol sol4 lab8 sol fa4 lab8 sol si sol lab fa |
	misb re misb fa sol4 fad8 sol r do,4 fa8 misb re re do |
	do re misb fa sol la sisb do r sol4 fa8 misb8. re16 do4 |
	sol'4 fa misb re do8 fa8. misb16 re8 misb8. re16 do4 |
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
			\line { يا شادي الألحان  }
			\right-align
			\line { آه أسمعنا رنة العيدان  }
			\right-align
			\line { يا لا لاللي يا لا لا آه يا لا لاللي  }
			\right-align
			\line { رنة العيدان  آه أسمعنا }
			\right-align
			\line { يا لا لاللي  يا لا لا لا لا آه يا لا لي }
			
			\line { \null }
			\line { \null }
			
			\right-align
			\line { و أطرب من في الحان  }
			\right-align
			\line { آه و أحسبنا من ضمن الندمان  }
			\right-align
			\line { يا لا لاللي يا لا لا آه يا لا لاللي  }
			\right-align
			\line { من ضمن الندمان  آه أحسبنا}
			\right-align
			\line { يا لا لاللي  يا لا لا لا لا آه يا لا لي }
		}
		\hspace #2
		\column
		{
		        \right-align
			\line { شعرك و الجبين آه و الوجنات  }
			\right-align
			\line { كالليل و النهار  }
			\right-align
			\line { يا لا لاللي يا لا لا آه يا لا لاللي  }
			\right-align
			\line { كالليل و النهار   آه والوجنات}
			\right-align
			\line { يا لا لاللي  يا لا لا لا لا آه يا لا لي }
			
			\line { \null }
			\line { \null }
			
			\right-align
			\line { هات يا فنّان هات }
			\right-align
			\line { آه أسمعنا  نغمات الكردان }
			\right-align
			\line { يا لا لاللي يا لا لا آه يا لا لاللي  }
			\right-align
			\line { نغمات الكردان  آه أسمعنا }
			\right-align
			\line { يا لا لاللي  يا لا لا لا لا آه يا لا لي }
		}
		\hspace #1
	}
}