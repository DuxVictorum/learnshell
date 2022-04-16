#!/usr/bin/bash

trap "echo 'Dude, bruh!'" SIGINT SIGTERM

num=0

while true; do
	echo "Time to sleep..."
	sleep 5
	num+=5
done

