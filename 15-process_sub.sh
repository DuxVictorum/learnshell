#!/usr/bin/bash

# Practice with process substitution

# Create ~/foof directory if it doesn't exist, then count current number of .txt files
if [ -d ~/foof ] ; then
	cd ~/foof
	num_files=$(ls *.txt | wc -l)
	echo "This directory has $num_files .txt files for use. Oh boy!"

	# Create .txt files if number is less than 4
	n=1
	while [ $n -le 4 ] ; do
		if [ -f file$n.txt ] ; then
			continue
		else
			touch file$n.txt
		fi
		n=$((n + 1))
		echo $n
	done

	# Add a new line of text to each .txt file
	for f in *.txt ; do
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

