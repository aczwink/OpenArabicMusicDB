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
\language "italiano"

\header
{
	title = "أحب الموسيقى"
	composer = "Farhan Sabbagh"
    tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}

#(set-global-staff-size 28)

\score {
  \header {
    piece = ""
  }
  \new Staff \relative do'
  {
    \key do \minor
    \time 4/4
    
    \repeat volta 2
    {
      r8 mib re do sol'2 |
      r8 mib re do lab'2 |
      r8 fa sol lab sol4 fa |
      mib re do2 |
    }
    
    \repeat volta 2
    {
      r8 sol'4 lab8 sib4 reb |
      r8 do4 sib8 lab sol fa4 |
      r8 fa4 sol8 lab4 do |
      r8 sib4 lab8 sol fa mib4 |
      r8 mib4 fa8 sol4 sib |
      r8 lab4 sol8 fa mib re4 |
      r8 re4 mib8 fa4 lab |
      sol8 fa mib re do2 |
    }
  }
}