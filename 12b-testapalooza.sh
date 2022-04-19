#!/usr/bin/bash

# More practice with file/directory/input testing

echo "Hello. Enter the name of a file to scan: "
read file_input

if [ -z $file_input ]; then
	echo "No file name given. Please re-run command with file name."
	break
fi

type=""

if [ -n $file_input ]; then
	echo "Scanning... "
	sleep 2

	# Check whether input is regular file, directory, or something else
	if [ -f $file_input ]; then
		echo "This is a regular file."
		type="file"
	elif [ -d $file_input ] ; then
		echo "This is a directory, not a file."
		type="directory"
	else
		echo "This is a weird file. I'd recommend burning it in a pile of rubbish. Or ignoring. Your call!"
		type="weird, crazy thing"
	fi
	
	# Check file/directory ownership
	echo "Checking ownership..."
	sleep 2

	if [ -O $file_input ]; then
		echo "Good news - you ($USER) already own this $type!"
	else
		echo "You are not the owner of this $type."
	fi

	# Check whether file or directory is empty
	echo "Checking contents... "
	sleep 2

	if [ -s $file_input ] ; then
		echo "The $type is not empty. Congratulations!"
	else
		echo "This is a lonely, empty $type. So desolate."
	fi

fi
