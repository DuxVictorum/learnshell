#!/usr/bin/bash
# Practice with loops, while, and until statements

POETS=(Homer Vergil Ovid Lucan)

# Loop through the POETS array
for p in ${POETS[@]}; do
	echo "Maybe you'd like to read $p?"
done

# While statement until Lucan is chosen
poet="not Lucan"
while [ "$poet" != "Lucan" ]; do
	echo "Which poet do you choose?"
	read chosen_poet
	echo ${#chosen_poet[@]}
	poet="$chosen_poet"
	if [[ "$poet" != "Lucan" ]]; then
		echo "You have chosen one of the greats! But not the greatest..."
	else 
		echo "Excellent choice! Lucan is the best, obviously."
	fi
done

# While statement counting down from 4
num_poets=${#POETS[@]}
while [ $num_poets -gt 0 ]; do
	if [ $num_poets -eq 1 ]; then
		echo "There is currently $num_poets poet left to read."
	else
		echo "There are currently $num_poets poets left to read."
	fi
	num_poets=$(($num_poets - 1))
done

# Until statement waiting for user to enter '5'
right_num=5
echo "Enter a number between 1 and 10. "
read user_num
until [ $user_num -eq $right_num ] ; do
	echo "That's a great number, but not the right one."
	echo -n "Enter another number:  "
	read user_num
done
