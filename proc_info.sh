#1/usr/bin/bash

# Quick and dirty script for printing out the number of threads a given process ID is running. :-)

proc_name=$(cat /proc/$1/status | grep Name | awk '{print $2}')
num_threads=$(cat /proc/$1/status | grep Threads | awk '{print $2}')

if [ -z $1 ] ; then
	echo "Please supply a PID (process ID number)."
else
	echo -e "PID $1 \t($proc_name) \tNumber of threads: $num_threads"
fi
