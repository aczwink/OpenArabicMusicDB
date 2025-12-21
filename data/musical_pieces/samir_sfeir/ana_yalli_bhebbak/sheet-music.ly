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
	title = "انا يللي بحبك"
	composer = "سمير صفير"
	tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}

\relative do'
{
  \key dod \kurd
  
  %intro  
  \partial 4 mi8 fad |
  sold fad mi re mi8. re16 dod4 |
  mi16 mi8 mi mi16 sold8 fad4 sold8 fad |
  sold fad mi re mi8. re16 dod4 |
  mi16 mi8 mi mi16 sold8 fad4 re'8 dod |
  dod si si la la sold sold fad |
  sold la sold si sold4 si8 la |
  sold fad mi sold fad mi re dod |
  %refrain
  \repeat volta 2
  {
    re mi re mi dod4 mi8 fad |
    sold4 sold sold sold |
    sold8 fad mi sold fad4 mi8 fad |
    sold4 sold sold sold |
    sold8 fad mi sold fad4 fad8 sold |
    la4 la la la |
    si8 la sold fad mi4 sold8 fad |
    la sold fad mi re dod si dod |
  }
  %bridge
  re mi re mi dod4 dod8 re |
  mi re dod re mi re dod4 |
  mi mi8 sold fad4 dod8 re |
  mi re dod re mi re dod4 |
  mi mi8 sold fad4 fad8 sold |
  la sold la sold la sold la4 |
  si8 la sold fad mi4 sold8 fad |
  la sold fad mi re dod si dod |
  re mi re mi dod4 sold'8 fad |
  
  %intro again
  sold fad mi re mi8. re16 dod4 |
  mi16 mi8 mi mi16 sold8 fad4 sold8 fad |
  sold fad mi re mi8. re16 dod4 |
  mi16 mi8 mi mi16 sold8 fad4 re'8 dod |
  dod si si la la sold sold fad |
  sold la sold si sold4 si8 la |
  sold fad mi sold fad mi re dod |
  re mi re mi dod4. dod8 |
  
  %verse
  \repeat volta 2
  {
    mi mi mi mi fad mi mi4 |
    fad8 mi re dod dod2 |
    mi4 mi fad mi |
    fad8 mi re dod mi4 re |
    r8 fad4 fad8 fad4. fad8 |
    sold fad mi red mi4. mi8 |
    fad mi re dod re dod re dod
    re mi mi re dod4. dod8 |
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
			\line { انا ياللي بحبك وحدي انا }
			\right-align
			\line { انا ياللي بريدك ليّا انا }
			\right-align
			\line { انا ياللي بعمري ببقي انا }
			\right-align
			\line { على وعدي ياوعدي ياوحدي انا }
			
			\right-align
			\line { \null }
			
			\right-align
			\line { على وعدي ياوعدي ياوحدي انا }
			\right-align
			\line { انا ياللي بعمري ببقي انا }
			\right-align
			\line { انا ياللي بريدك ليّا انا }
			\right-align
			\line { انا ياللي بحبك وحدي انا }
		}
		\hspace #2
		\column
		{
			\right-align
			\line { الهوى ياحبيبي الهوى اسرار }
			\right-align
			\line { حيره وغيره وشوء ونار }
			\right-align
			\line { تسأل كيف بغار عليك }
			\right-align
			\line { وقلبك علم قلبي يغار }
			
			\right-align
			\line { \null }
			
			\right-align
			\line { الدنيا بتحلى و انا واياك }
			\right-align
			\line { غير عمري بلحظه هواك }
			\right-align
			\line { ماكان البي بيعرف حب }
			\right-align
			\line { ولا عندو غالي لولاك }
		}
		\hspace #1
	}
}
