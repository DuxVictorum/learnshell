#!/usr/bin/bash

if [ -e $1 ]; then
	echo "Yes, that file exists."
else
	echo "Sorry, that file does not exist."
fi

if [ -d "/home/mthorne/learnshell/testdir/" ]; then
	echo "Yes, I can find the testdir/ directory."
else
	echo "Sorry, I cannot find the testdir/ directory at all."
fi
