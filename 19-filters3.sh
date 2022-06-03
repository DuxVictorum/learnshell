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

# 5) Using sed to transform web URLs
echo -e "\nAnother use is to do group transform of web URLs. Here 'luther.edu/mathorn2' becomes 'boeing.com/markthorne9'"
echo "https://www.luther.edu/mathorn2" | sed 's_luther.edu/mathorn2_boeing.com/markthorne9_'

#6) Using sed to store replaced data
echo -e "\nAnd now we will use sed to store/archive the data to be replaced."
echo "Richard Garfield is the manager." | sed 's/Richard Garfield/Steve Rogers/' >> manager_archive.txt
cat manager_archive.txt
