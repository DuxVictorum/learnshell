#!/usr/bin/bash

# Grep practice
gp=grep_practice.txt

# 0 - a quick test of the emergency grep-cast system!

echo "This is not a test
this is the Real Thing!" | grep -i thin

# 1 - Basic grep exercises

grep 'x[0-9]\{4\}' $gp
grep '^[0-9]\{3\} ' $gp
grep ' 2013$' $gp
grep '[aeiou].[aeiou]' $gp
