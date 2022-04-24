#1/usr/bin/bash

# Practice with command line argument parsing and the getopt command

while getopts u:a:f:h flag ; do
	case "${flag}" in
		u) username=${OPTARG};;
		a) age=${OPTARG};;
		f) fullname=${OPTARG};;
		h) echo "You need help? You're in it to win it, buster! No help for you!"
	esac
done
echo "Username: $username";
echo "Age: $age";
echo "Full name: $fullname";

