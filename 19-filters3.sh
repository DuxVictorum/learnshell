#!/usr/bin/bash

# Fun with the 'sed' command
# 1) Printing every third line of a file
echo -e "The first use of 'sed' will print every third line, starting with line 1.\n"
sed -n 1~3p grep_practice.txt

# 2) Basic text string replacement
echo -e "\n\nThe 'sed' command has basic text replacement capabilities. Here 'High School' becomes:"
grep 'High School' grep_practice.txt | sed 's/High School/Dolphin Puddle/'
