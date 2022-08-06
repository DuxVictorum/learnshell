#!/bin/bash

# Practice using checksum tools: cksum

FILE1="./LICENSE"

echo -e "Here is the checksum of the file $FILE1. \n--> $(cksum $FILE1)"
echo "Adding additional text..."
sleep 2
echo -e "\nHere's another line to the file. What will the new checksum be?" >> $FILE1
echo -e "And now here is the new checksum: \n--> $(cksum $FILE1)"

# Add comparison test to check whether the checksum is different or not. :-)
