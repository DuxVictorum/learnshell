#!/bin/bash

# Practice using checksum tools: cksum

# Text file to practice on
FILE1="./LICENSE"
# Generate the starting checksum for the file
STARTING_CHECKSUM=$(cksum $FILE1 | awk '{print $1}')
# Generate randomly a 0 [no additional line] or 1 [yes additional line].
ADDLINE=$(($RANDOM%2))

echo -e "Here is the current checksum of the file $FILE1. \n  --> $STARTING_CHECKSUM."
if [ $ADDLINE -eq 1 ]; then
  echo "Now adding some additional text..."
  sleep 1
  echo -n "Here's another line to the file." | tee -a $FILE1
  echo -e "\tThe new checksum is $(cksum $FILE1 | awk '{print $1}')." | tee -a $FILE1
else 
  echo -e "No new text this time. Your checksum is still $(cksum $FILE1 | awk '{print $1}')."
fi

# Use the 'shuf' command to generate a number between 1 and 20.
echo -e "\nBy the way, you just rolled a $(shuf -i 1-20 -n1) on your D20. Have a great day!"