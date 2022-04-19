#!/usr/bin/bash

# More practice with file/directory/input testing

echo "Hello. Enter the name of a file to scan: "
read file_input

file_status=0

if [ -z $file_input ]; then
	echo "No file name given. Please re-run command with file name."
fi

if [ -n $file_input ]; then
	echo "Scanning... "

	if [ -f $file_input ]; then
		echo "This is a regular file."
	else if [ -d $file_input ] ; then
		echo "This is a directory, not a file."
	else
		echo "This is a weird file. I'd recommend burning it in a pile of rubbish. Or ignoring. Your call!"
	fi
	
	# Check file/directory ownership
	if [ -O $file_input ]; then
		echo "Good news - you ($USER) already own this file!"
	else
		echo "You are not the owner of this file."
	fi
fi
