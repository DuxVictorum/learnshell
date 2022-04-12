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


# Exercise 2 - Function to translate sentences to arithmatic expressions

function ENGLISH_CALC {
	num1=$1
	num2=$3
	case $2 in 
		"plus") echo "$num1 + $num2 = $((num1 + num2))";;
		"minus") echo "$num1 - $num2 = $((num1 - num2))";;
		"times") echo "$num1 * $num2 = $((num1 * num2))";;
	esac
}

# testing code
ENGLISH_CALC 3 plus 5
ENGLISH_CALC 5 minus 1
ENGLISH_CALC 4 times 6
