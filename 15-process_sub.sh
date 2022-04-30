#!/usr/bin/bash

# Practice with process substitution

files=()
if [ -d ~/foof ] ; then
	cd ~/foof
	num_files=$(ls file?.txt | wc -l)
	echo "This directory has $num_files for use. Oh boy!"

	for f in file?.txt ; do
		echo -n "Scanning file ..."
		if [ -s $f ] ; then
			echo "File $f already has contents."
		else
			echo -n "File $f is currently empty." 
		fi
		echo -e "\tAdding new contents..."
		sleep 1
		num_lines=$(cat $f | wc -l)
		echo "Now this file has $num_lines lines of text." >> $f
	done
else 
	mkdir ~/foof
	echo "New directory ~/foof is now made. Please re-run this script."
fi

