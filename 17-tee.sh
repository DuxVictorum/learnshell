#!/usr/bin/bash

# Practice with the tee command

gp=grep_practice.txt

grep '^Oct.' $gp | tee gp_results.txt
