#!/usr/bin/bash

if [ -f $1 ]; then
	echo "Yes, that file exists and it's a regular file."
else
	echo "Sorry, that file does not exist or it's not a regular file."
fi

if [ -d "/home/mthorne/learnshell/testdir/" ]; then
	echo "Yes, I can find the testdir/ directory."
else
	echo "Sorry, I cannot find the testdir/ directory at all."
fi
