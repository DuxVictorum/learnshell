#!/usr/bin/bash
# Practicing conditions and comparison operators at learnshell.org

num=$1
name=$2

# check that both arguments are passed
if [ -e $num ] || [ -e $name ]; then
	echo "Umm, you forgot to provide a number and a name."
fi

# check to see if first argument is less or more than 10
if [ $num -lt 10 ]; then
	echo "You entered a number less than 10. Single digit territory."
elif [ $num -gt 10 ]; then
	echo "You entered a number greater than 10. Double digits!"
elif [ $num -eq 10 ] && [ $name != "Greg" ];  then
	echo "You entered 10! You're not Greg though."
elif [ $num -eq 10 ] && [ $name = "Greg" ]; then
	echo "You entere 10 *and* your name is Greg! Whoo hoo!"
fi
	
# elif [ "$num" = 55 ] || [ "$name" = "Greg" ]; then
#	echo "Either you guessed 55 or your name is Greg."
# elif [ $num = 56 ] && [ $name = "Greg" ]; then
#	echo "Amazing, you guessed higher than 55 AND your name is Greg!"
# elif [ $num -gt 55 ] && [ $name != "Greg" ]; then
#	echo "Nice, you got at least one right."
#else
#	echo "Dang, your name is not Greg and you guessed too low (lower than 55)."


