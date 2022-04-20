#1/usr/bin/bash

# Quick and dirty script for printing out the number of threads a given process is running. :-)

is_pid=1

# Check to see if any argument was passed
if [ -z $1 ] ; then
	echo "Please supply a PID (process ID number) or process name."
	break

# Check whether argument was a (numeric) PID or (alphabetic) process name
elif [[ $1 =~ ^[0-9]+$ ]] ; then
	proc_name=$(cat /proc/$1/status | grep Name | awk '{print $2}')
	num_threads=$(cat /proc/$1/status | grep Threads | awk '{print $2}')
	echo -e "PID $1 \t$proc_name \tNumber of threads: $num_threads"
else
	proc_num=$(ps -eF | grep -m 1 $1 | awk '{print $2}')
	proc_name=$(cat /proc/$proc_num/status | grep Name | awk '{print $2}')
	num_threads=$(cat /proc/$proc_num/status | grep Threads | awk '{print $2}')
	echo -e "PID $proc_num \t$proc_name \tNumber of threads: $num_threads"

fi
