#1/usr/bin/bash

# Quick and dirty script for printing out the number of threads a given process is running. :-)

is_pid=1

# Check to see if any argument was passed
if [ -z $1 ] ; then
	echo "Please supply a PID (process ID number) or process name."
	break

# Check whether argument was a (numeric) PID or (alphabetic) process name

# A) If a PID is passed...
elif [[ $1 =~ ^[0-9]+$ ]] ; then
	if [ -e /proc/$1/status ] ; then
		proc_name=$(cat /proc/$1/status | grep Name | awk '{print $2}')
		num_threads=$(cat /proc/$1/status | grep Threads | awk '{print $2}')
		echo -e "PID $1 \t$proc_name \tNumber of threads: $num_threads"
	else
		echo "No such PID found on the system. Please enter a valid PID."
	fi

# B) Else if a process name string is passed...
else
	proc_array=(`ps -eF | grep $1 | grep -v grep | awk '{print $2}'`)
	# echo ${proc_array[@]}
	if [ ${#proc_array[@]} -eq 0 ] ; then
		echo "No such process found on the system. Please enter an existing process name."
	else
		for ps_num in ${proc_array[@]} ; do
			ps_name=$(cat /proc/$ps_num/status | grep Name | awk '{print $2}')
			if [[ $ps_name == *"$1"* ]] ; then
				proc_num=$ps_num
				proc_name=$ps_name
				num_threads=$(cat /proc/$proc_num/status | grep Threads | awk '{print $2}')
				echo -e "PID $proc_num \t$proc_name \tNumber of threads: $num_threads"
				break
			fi
		done
	fi

fi
