#!/usr/bin/bash

# Fun with the 'sed' command
# 1) Printing every third line of a file
echo -e "The first use of 'sed' will start at line 1 and print every third line.\n"
sed -n 1~3p grep_practice.txt

# 2) Basic text string replacement
echo -e "\n\nThe 'sed' command has basic text replacement capabilities. Here 'High School' becomes:"
grep 'High School' grep_practice.txt | sed 's/High School/Dolphin Puddle/'

# 3) Using sed to delete selection from text stream
echo -e "\nNow the 'sed' command will delete all the email addresses from 'grep_practice.txt' file!"
echo -e "\nFirst here are the email addresses in the file."
grep 'example.com' grep_practice.txt
echo -e "\n But now the emails are gone!"
grep 'example.com' grep_practice.txt | sed /example.com/d

# 4) Using sed to print only the first five lines of the LICENSE file
echo -e "\nSed can print a specific number of lines of a stream, e.g. the first five lines."
sed -n '1,5p' LICENSE
