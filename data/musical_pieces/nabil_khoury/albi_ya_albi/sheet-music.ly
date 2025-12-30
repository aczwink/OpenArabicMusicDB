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
\version "2.24.4"
\include "arabic.ly"

\header
{
  title = "قلبي يا قلبي"
  composer = "نبيل خوري"
  tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}


#(set-global-staff-size 23)

\score {
  \header {
    piece = ""
  }
  \relative fa'
  {
    \key fa \major
    \time 4/4
    
    %guitar intro
    fa8 re fa16 sol fa8 r4 r16 la do re |
    fa,8 re fa16 sol fa8( fa) sol( sol4) |
    fa32 sol fa16 re do fa sol fa8 r4 r8 la |
    sib2 sib16 la fa re fa sol fa8 |
    %singing begings: albi ya albi
    \repeat volta 2
    {
      <<
        { r8 }
        \\
        { fa8 }
      >> la~( la16 la8 la16 sib8 la sol fa) |
      r8 la~( la16 la8 do16 sib8. la16 sol8 fa) |
      r la( la la sib la sol fa |
    }
    \alternative {
      { fa2) r4 la32 sib la16 do8 | }
      { fa,2\repeatTie r4 r8 do( | }
    }
    \repeat volta 2
    {
      mi8. fa16~ fa8 sol sol8. fa16~ fa8) do( |
      mi8. fa16~ fa8 sol sol8. fa16~ fa8) re( |
      fa8. fa16~ fa8 fa fa8. re16~ re8 fa) |
    }
    \alternative {
      { r2 r4 r8 do8 | }
      { r4 r8 sib'~( sib4 sib8 la | }
    }
    \repeat volta 2
    {
      la8.) la16~( la la8 la16 sol8 fa sol la |
      la8.) la16~( la la8 do16 sib8. la16 sol8 fa) |
      r la( la la sib la sol fa |
    }
    \alternative {
      { fa4) r sib4.( la8) | }
      { sib2( sib16 do sib la sol fa8.) | }
    }
  }
  \midi { }
  \layout { }
}