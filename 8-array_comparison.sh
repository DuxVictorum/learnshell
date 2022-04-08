#!/usr/bin/bash

a=(4 7 28 53)
b=(3 9 14 28 52 53)
c=(10 28 46 53 99)

x=()
echo ${x[@]}
for na in ${a[@]}; do
	for nb in ${b[@]}; do
		if [ $na -eq $nb ]; then
			x=(${x[@]} $na)
		fi
	done
done

echo ${x[@]}
