#!/usr/bin/bash

echo "Your arguments were:"
for arg in $@; do
	echo $arg;
done
echo "That's $# in total!"
