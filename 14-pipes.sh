#!/usr/bin/bash

# Practice with pipes -- Identify the number of processors by looking in /proc/cpuinfo)

if [ $# -eq 0 ] ; then
	echo -e "\tError: include one or more flags (-c, -m, -v) after the main command"
fi

while getopts :cmv flag ; do
	case $flag in 
		c) echo "There are $(cat /proc/cpuinfo | grep processor | wc -l) processors.";;
		m) echo "Your CPU MHz speed is $(cat /proc/cpuinfo | grep -m1 MHz | awk '{print $4}').";;
		v) echo "Your processors are $(cat /proc/cpuinfo | grep -m1 vendor_id | awk '{print $3}').";;
		?) echo "What kind of flag was that?";;
	esac
done
