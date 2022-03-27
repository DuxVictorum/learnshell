#!/usr/bin/sh
# Some practice with basic string operations

motto="Each man made his own shipwreck."
echo Our motto has ${#motto} characters.
expr index "$motto" "h"		# 4; with 'expr' the count starts at 1 (not 0)
expr length "$motto"

# Practicing string extraction
name1="praenomen=Marcus,nomen=Tullius,cognomen=Cicero"
P_END=$(expr index $name1 ',')
COMMA1=$(expr index $name1 '=')
P_LENGTH=$((P_END - COMMA1))
echo First equals sign is at index $COMMA1.
echo First comma is at index $P_END.
PRAE=$(name1:$COMMA1:$P_LENGTH)
echo His praenomen is $PRAE.
