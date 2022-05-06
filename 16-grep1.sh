#!/usr/bin/bash

# Grep practice
gp=grep_practice.txt

# 0 - a quick test of the emergency grep-cast system!

echo "This is not a test
this is the Real Thing!" | grep -i thin

# 1 - Basic grep exercises
echo "#1) All lines with a x???? phone extension"
grep 'x[0-9]\{4\}' $gp

echo "#2) All lines that begin with 3 digits followed by a blank"
grep '^[0-9]\{3\} ' $gp

echo "#3) All lines that contain a date"
grep ' 2013$' $gp

echo "#4) All lines containing a vowel followed by a single character followed by the SAME vowel
echo -e "\tStill figuring this one out.
# I can't figure this one out yet: vowel+.+same_vowel [NOT grep '[aeiou].[aeiou]' $gp]

echo "#5) All lines that do not begin with a capital S :-)"
grep '^[^S]' $gp

echo "#6) All lines that contain CA in upper or lowercase"
grep -i 'ca' $gp

echo "#7) All lines with an email address along with line number"
grep -n @ $gp

echo "#8) All lines that do NOT contain Sep."
grep -v Sep. $gp

echo "#9) All lines that contain 'de' as a separate word"
grep grep -w de $gp
