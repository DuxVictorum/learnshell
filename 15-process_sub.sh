#!/usr/bin/bash

# Practice with process substitution

if [ -d ~/foof ] ; then
	for f in ~/foof/file?.txt ; do
		echo "Scanning file ..."
		if [ -s $f ] ; then
			echo "File $f already has contents."
		else
			echo "File $f is empty -- but not for long!"
			echo "Adding contents..."
			sleep 1
			echo "These are some words! Enjoy them!" >> $f
		fi
	done
else 
	mkdir ~/foof
	echo "New directory ~/foof is now made."
fi

