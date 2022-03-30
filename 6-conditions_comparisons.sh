#!/usr/bin/bash
# Practicing conditions and comparison operators at learnshell.org

num=56
name="Greg"

if [ "$num" = 55 || "$name" = "Greg"]; then
	echo "Either you guessed 55 or your name is Greg."
elif [ $num = 56 && $name = "Greg" ]; then
	echo "Amazing, you guessed higher than 55 AND your name is Greg!"
elif [ $num -gt 55 && $name != "Greg" ]; then
	echo "Nice, you got at least one right."
else
	echo "Dang, your name is not Greg and you guessed too low (lower than 55)."
fi


