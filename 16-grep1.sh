#!/usr/bin/bash -i

# Grep practice
gp=grep_practice.txt

# 0 - a quick test of the emergency grep-cast system!

echo "This is not a test
this is the Real Thing!" | grep -i thin

# 1 - Basic grep exercises
echo "#1) All lines with a x???? phone extension"
grep 'x[0-9]\{4\}' $gp

echo -e "\n#2) All lines that begin with 3 digits followed by a blank"
grep '^[0-9]\{3\} ' $gp

echo -e "\n#3) All lines that contain a date"
grep ' 2013$' $gp

echo -e "\n#4) All lines containing a vowel followed by a single character followed by the SAME vowel"
grep '\([aeiou]\).\1' $gp

echo -e "\n#5) All lines that do not begin with a capital S :-)"
grep '^[^S]' $gp

echo -e "\n#6) All lines that contain CA in upper or lowercase"
grep -i 'ca' $gp

echo -e "\n#7) All lines with an email address along with line number"
grep -n @ $gp

echo -e "\n#8) All lines that do NOT contain Sep."
grep -v Sep. $gp

echo -e "\n#9) All lines that contain 'de' as a separate word"
grep -w de $gp

echo -e "\n#10) All lines with a last name ending in -son except Don Henderson (output is cyan)"
export GREP_COLORS='ms=01;33:mc=01;31:sl=01;36:cx=:fn=35:ln=32:bn=32:se=36'
grep '.*son' $gp | grep -v @ | grep -v Don

echo -e "\n#11) Same as above except entirely with grep"
export GREP_COLORS='ms=04;33:mc=01;31:sl=95:cx=:fn=35:ln=32:bn=32:se=36'
grep -P '(?<!Don Hender)son(?!.*@)' $gp
