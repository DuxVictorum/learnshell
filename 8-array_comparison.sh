#!/usr/bin/bash

a=(4 7 28 53)
b=(3 9 14 28 52 53)
c=(10 28 46 53 99)

#comparison of first two arrays a and b
for x in "${a[@]}"; do
  in=false
  for y in "${b[@]}"; do
    if [ $x = $y ];then
      # assigning the matching results to new array z
      z[${#z[@]}]=$x
    fi
  done
done
#comparison of third array c with new array z
for i in "${c[@]}"; do
  in=false
  for k in "${z[@]}"; do
    if [ $i = $k ];then
      # assigning the matching results to new array j
      j[${#j[@]}]=$i
    fi
  done
done
# print content of array j
echo ${j[@]}
