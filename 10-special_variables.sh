#!/usr/bin/bash

echo "Your arguments were:"
for arg in $@; do
	echo $arg;
done
echo "That's $# in total!"

echo "The exit status on that was $?."
echo "The current process number is $$. That's pretty cool."
