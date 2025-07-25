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
\version "2.19.80"
\include "arabic.ly"

#(set-global-staff-size 28)

\header
{
	title = "صيد العصاري"
  tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}

\relative sol'
{
	\key do \rast
	\time 2/4
	sol sol |
	fa la8 sol |
	sol4. fa8 |
	misb misb fa misb |
	
	\repeat volta 2
	{
	  re do la' sol |
	  sol sol16 la sol fa sol8 |
	  la sol sol fa |
	  fa misb misb re |
	  re4 misb8 re |
	  do4 fa8 misb |
	}
	
	re re misb re |
	do sol' misb fa |
	re do misb4 |
	misb16 re do8 r do16 re |
	misb re misb fa sol8 do,16 re |
	misb re misb fa sol4
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
      \line { صيد العصاري يا سمك يا بني }
      \right-align
      \line { تلعب بالميه لعبك يعجبني }
      \right-align
      \line { أه يا سمك بني }
      \right-align
      \line { \null }
      \right-align
      \line { صيادك ماهر بياعك شاطر }
      
      \right-align
      \line { وجودك نادر محلاك يا بني  }
      
      \right-align
      \line { أه يا سمك بني }
    }
    \hspace #20
  }
}