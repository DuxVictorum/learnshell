#!/usr/bin/bash

a=(4 7 28 53)
b=(3 9 14 28 52 53)
c=(10 29 46 53 99)

# Initialize empty array to hold the shared numbers
x=()
y=()
z=()

# Compare arrays a and b, storing shared numbers in array x
for na in ${a[@]}; do
        for nb in ${b[@]}; do
                if [ $na -eq $nb ]; then
                        x=(${x[@]} $na)
                fi
        done
done
echo ${x[@]}

# Compare array a with array c, storing shared numbers in array y
for na in ${a[@]}; do
        for nc in ${c[@]}; do
                if [ $na -eq $nc ]; then
                        y=(${y[@]} $nc)
                fi
        done
done
echo ${y[@]}

# Compare array x and array y, storing shared numbers in array z
for nx in ${x[@]}; do
	for ny in ${y[@]}; do
		if [ $nx -eq $ny ]; then
			z=(${z[@]} $nx)
		fi
	done
done

# Print out numbers common to all arrays
echo "The number(s) shared in common across all arrays are/is: ${z[@]}."
