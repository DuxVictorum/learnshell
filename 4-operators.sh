#!/usr/bin/bash 
DOG=7
FROG=12
LOG=$((($DOG + $FROG) % 3))	# expects answer of '1'

echo The total sum is $LOG.
echo But let\'s make that bigger by adding 3 and squaring it: $((($LOG + 3) ** 2))!

COST_PINEAPPLE=50
COST_BANANA=4
COST_WATERMELON=23
COST_BASKET=1

TOTAL=$((COST_PINEAPPLE + (COST_BANANA * 2) + (COST_WATERMELON * 3) + COST_BASKET))

echo "Total Cost is $TOTAL"
