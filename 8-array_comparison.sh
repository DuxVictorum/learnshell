#!/usr/bin/bash

a=(4 7 28 53)
b=(3 9 14 28 52 53)
c=(10 28 46 53 99)

# Initialize empty array to hold the shared numbers
x=()
y=()

# Compare arrays a and b, storing shared numbers in array x
for na in ${a[@]}; do
        for nb in ${b[@]}; do
                if [ $na -eq $nb ]; then
                        x=(${x[@]} $na)
                fi
        done
done
echo ${x[@]}

# Compare array a with array c
for na in ${a[@]}; do
        for nc in ${x[@]}; do
                if [ $na -eq $nc ]; then
                        y=(${y[@]} $nc)
                fi
        done
done
echo ${y[@]}
