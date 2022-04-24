#1/usr/bin/bash

# Practice with command line argument parsing and the getopt command

while getopts u:a:f: flag ; do
	case "${flag}" in
		u) username=${OPTARG};;
		a) age=${OPTARG};;
		f) fullname=${OPTARG};;
	esac
done
echo "Username: $username";
echo "Age: $age";
echo "Full name: $fullname";
