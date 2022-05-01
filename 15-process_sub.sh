#!/usr/bin/bash

# Practice with process substitution

# Create ~/foof directory if it doesn't exist; run the script if it does exist
if [ ! -d ~/foof ] ; then
	mkdir ~/foof
	echo "New directory ~/foof is now made. Please re-run this script."
else
	cd ~/foof
	# Count current number of .txt files in the directory
	if [ -f *.txt ] ; then
		num_files=$(ls *.txt | wc -l)
		echo "This directory has $num_files files for use. Oh boy!"
	else 
		echo "This directory has 0 files -- let's fix that right now!"
	fi

	# Check that 4 .txt files are present; create any missing files
	n=1
	while [ $n -le 4 ] ; do
		if [ ! -f file$n.txt ] ; then
			touch file$n.txt	
		fi
		n=$((n + 1))
	done

	# Add a new line of text to each .txt file
	for f in *.txt ; do
		echo -n "Scanning file ..."
		if [ -s $f ] ; then
			echo -n "File $f already has contents."
		else
			echo -n "File $f is currently empty." 
		fi
		echo -e "\tAdding new contents..."
		sleep 1
		num_lines=$(cat $f | wc -l)
		echo "Now this file has $((num_lines + 1)) lines of text." >> $f
	done

fi

