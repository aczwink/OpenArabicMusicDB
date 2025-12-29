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
  title = "أشتكي منو"
  composer = "حمدي الصديق"
  tagline = \markup { \abs-fontsize #11 "Released as part of https://github.com/aczwink/OpenArabicMusicDB. Copyright (C) 2025 Amir Czwink" }
}


%#(set-global-staff-size 23)

\score {
  \header {
    piece = ""
  }
  <<
  \new Staff \with { instrumentName = "Lead" shortInstrumentName = "Lead" } \relative sol'
  {
    \key sold \kurd
    \time 4/4
    \compressEmptyMeasures
    \tempo 4 = 135
    
    %intro    
    \repeat volta 2
    {
      fad8 sold sold32 la16 sold32 fad8 fad sold sold32 la16 sold32 fad8 |
      fad sold la si16 dod si8 la16 si la8 sold |
      r1 |
      r1 |
    }
    \alternative {
      { R1*2 | }
      { R1*2 | }
    }
    %verse
    \repeat unfold 2
    {
      r4 dod,8 red mi4 red8 mi8( |
      mi) r dod red mi mi  red mi |
      r4 dod4 mi dod8 red8( |
      red1) |
      r4 red8 mi fad4 mi8 fad |
      r4 red8 mi fad fad mi fad |
      r4 fad fad4. la8 |
      sold1 |
    }
    %refrain
    sold4^\markup{ \musicglyph "scripts.segno" } sold8 fad sold4 sold |
    r2 r4 r8 sold |
    la la la sold la4 la |
    r2 r4 r8 si |
    si si si la si la la sold |
    sold4 fad8 la sold4. sold8 |
    fad sold sold fad sold4 sold |
    r2 r4 r8 sold |
    la la la sold la4 la |
    r2 r4 r8 si |
    si si si la si la la sold |
    sold4 fad8 la sold4.-\markup { \italic "FINE"} sold,8 |
    %allah allah part
    dod r r mi mi r r mi |
    red dod mi red dod4 sold |
    dod8 r r mi mi r r mi |
    fad fad la fad sold4. sold,8 |
    dod r r mi mi r r mi |
    red dod mi red dod4 sold |
    dod8 r r mi mi r r mi |
    fad fad la fad sold2-\markup { \italic "D.S." \tiny \raise #1 \musicglyph "scripts.segno" \italic " al fine"} |
  }
  \new Staff \with { instrumentName = "Violin" shortInstrumentName = "Vln." } \relative sol'
  {
    \key sold \kurd
    \time 4/4
    
    \repeat volta 2
    {
      r1 |
      r1 |
      r8 \tuplet 3/2 { mi'16 fad mi } red8 mi r8 \tuplet 3/2 { red16 mi red } dod8 red |
      r8 \tuplet 3/2 { si16 dod si } si8 la \tuplet 3/2 { la16 si la } r8 la sold |
    }
    \alternative {
      { R1*2 | }
      { R1 | }
    }
    r8 dod si la \tuplet 3/2 { si16 dod si } r8 la sold |
    %verse
    dod2 r |
    R1*2 |
    r8 sold, la sid dod red mi fa |
    fad2 r |
    R1*2 |
    r8 sold fad red do sold do red |
    dod2 r4 r8 mi' |
    dod2 r4 r8 sold '|
    mi2 r |
    r8 sold, la sid dod red mi fa |
    fad2 r4 r8 fad |
    red2 r4 r8 dod' |
    la2 r |
    r8 sold,16 sold la la sid sid dod dod red red mi mi fad fad |
    %refrain
    sold8 r2 sold8 r sold |
    r8 dod,16 red dod8 red mi fad sold r |
    r2 r8 la8 r la |
    r8 red,16 mi red8 mi fad sold la r |
    r4 \tuplet 3/2 { si16 dod si } la8 r r \tuplet 3/2 { la16 si la } sold8 |
    r2 dod,16 red mi fad sold4 |
    r8 sold sold dod, r8 sold' sold dod, |
    r8 dod16 red dod8 red mi fad sold r |
    r8 la fad dod r8 la' fad dod |
    r8 red16 mi red8 mi fad sold la r |
    si2(\pp\< si\f) |
    dod,8 red mi fad sold r r4 |
    %allah allah part
    r8 sold^"pizz." dod, r r dod r r |
    r r r red dod4 sold4 |
    r8 sold' dod, r r dod r r |
    r fad la fad sold4 sold^"arco" |
    r8 sold,, dod r r dod16 red mi8 r |
    r mi' sold fad \tuplet 3/2 { mi16 fad mi } red8 sold, r |
    r8 sold, dod r r dod16 red mi8 r |
    r8 fad' la fad sold r r4 |
  }
  >>
  \midi { }
  \layout { }
}