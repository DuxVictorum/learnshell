#!/usr/bin/bash
# Practice with loops, while, and until statements

POETS=(Homer Vergil Ovid Lucan)

for p in ${POETS[@]}; do
	echo "Maybe you'd like to read $p?"
done

echo "Which poet do you choose?"
read poet

if [ $poet = "Homer" -o $poet = "Vergil" ]; then
	echo "You have chosen one of the greats!"
fi

num_poets=4
while [ $num_poets -gt 0 ]; do
	echo "There are currently $num_poets poets left to read."
	num_poets=$(($num_poets - 1))
done
