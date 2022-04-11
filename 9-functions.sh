#!/usr/bin/bash

# Function to calculate the square of the first argument

num=$1

function squareNum {
	echo "$((num ** 2))"
}

echo "The square of $num is $(squareNum)."

# Learned some things: 
# a) inside the double parentheses of arithmetic expansion you do not need to say $num but just num
# b) if you declare 'num=$1' *inside* the function, then $1 isn't the first parameter from the bash shell but rather the first parameter from wherever you call the function within the script (in this case line 11).
# c) Bash isn't great for doing arithmetic compared to modern programming languages, ha. :-) 
