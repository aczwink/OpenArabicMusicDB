<!--
 OpenArabicMusicDB
 Copyright (C) 2025 Amir Czwink (amir130@hotmail.de)
  
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU Affero General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
  
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Affero General Public License for more details.
 
 You should have received a copy of the GNU Affero General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
-->

For Arabic rhythms usually only the dominant or strokes with accentuation are written. However, detailed accentuation is usually not given for Arabic rhythms giving the performer some freedom to play and vary as he believes is matching with the piece being played. Accentuation can also often be derived by the relationship of the stroke with a hand, with weak hand being less emphasized as strong hand.
In contrast accentuation in Turkish percussion is precisely defined. Thus the following lists a definition of necessary accentuation symbols that will be used in this wiki. Note that they are defined differently for classical music.
* Strong accent
For this, the marcatissimo symbol is used.
<score type="rhythm">
\override Staff.TimeSignature #'stencil = ##f 
	
\dom_strong
</score>

* Semi-strong (medium) accent
For this, the marcato symbol is used.
<score type="rhythm">
\override Staff.TimeSignature #'stencil = ##f 
	
\dom_semi
</score>
A note that has no accentuation symbol means that it is not emphasized.
