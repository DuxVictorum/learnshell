#!/usr/bin/bash
# Practice time for passing command line arguments

echo The name of this file is $0.
echo $1" is pretty interesting. So is $2."
echo $# is a nice number of arguments. 

function File {
	echo You entered the following arguments: $@
}

if [ ! $# -lt 1 ]; then
	File $*
	exit 0
fi

bash 
