#!/usr/bin/bash

trap "brotime" SIGINT

num_int=0
num=0

brotime() {
	num_int=$((num_int + 1))
	if [ $num_int -eq 1 ]; then
		echo "Type CTRL-C one more time to exit."
	else
		echo "Exiting..."
		exit
	fi
}

while [ $num -lt 15 ]; do
	echo "Time to sleep...$num seconds."
	sleep 5
	num=$((num + 5))
done
