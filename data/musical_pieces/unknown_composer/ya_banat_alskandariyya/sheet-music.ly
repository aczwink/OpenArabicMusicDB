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
\version "2.24.1"
\language "italiano"

#(set-global-staff-size 30)

\header
  {
    title = "يا بنات إسكندريّة"
    tagline = "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink"
  }

\score
{
  \new Staff \relative do'
  {
    \key sol \minor
    \time 4/4
    
    \repeat volta 2
    {    
      re'16 mib re do sib la sib do re mib re do sib la sol8 |
    }
    \alternative
    {
      { re'16 mib re do sib la sib do re2 | }
      { la16 do sib la la sol sol fad sol2 | }
    }
    
    \break
    
    \repeat volta 2
    {
      sol8. re'16 re8 re mib16 re mib fa re8 re |
    }
    \alternative
    {
      { do do16 do sib8 do re16 mib re do sib la sol8 | }
      { do do16 do sib8 do re2 }
    }
    
    \break
    
    \repeat volta 2
    {
      sol,8. la16 sib8 do re16 mib re do sib la sol8 |
    }
    \alternative
    {
      { la16 do sib la la sol fad sol la2 | }
      { la16 do sib la la sol sol fad sol2 | }
    }
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
			\line { يا بنات اسكندرية عشقكم حرام }
			\right-align
			\line { داب قلبي و داب جسمي كلو من الغرام }
		}
		\hspace #10
	}
}