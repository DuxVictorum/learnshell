#!/usr/bin/bash
NAMES=( Vergil Ovid Lucan ) 
NUMBERS=(1 2 3)
STRINGS=(civil war really sucks)
NumberOfNames=${#NAMES[@]}
second_name=${NAMES[1]}

echo ${NUMBERS[*]}
echo One of our time-honored mottos is ${STRINGS[@]}!
echo The number of great Roman poets listed in the NAMES array: ${#NAMES[@]}
echo The second name on the NAMES list is: ${NAMES[1]}
