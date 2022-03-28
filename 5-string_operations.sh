#!/bin/bash
# Some practice with basic string operations

motto="Each man made his own shipwreck."
echo Our motto has ${#motto} characters.
expr index "$motto" "h"		# 4; with 'expr' the count starts at 1 (not 0)
expr length "$motto"

# Practicing string extraction
name1="praenomen=Marcus,nomen=Tullius,cognomen=Cicero"

# Extracting the praenomen
COMMA1=$(expr index $name1 ',')
EQU1=$(expr index $name1 '=')
PRAE_LENGTH=$((COMMA1 - EQU1 - 1))

echo First equals sign is at index $EQU1.
echo First comma is at index $COMMA1.
echo The praenomen length is $PRAE_LENGTH characters.
PRAENOMEN=${name1:$EQU1:$PRAE_LENGTH}

# Extracting the nomen
REM_1=${name1:$COMMA1}
COMMA2=$(expr index $REM_1 ',')
EQU2=$(expr index $REM_1 '=')
NOM_LENGTH=$((COMMA2 - EQU2 - 1))
NOMEN=${REM_1:$EQU2:$NOM_LENGTH}

# Extracting the cognomen
REM_2=${REM_1:$COMMA2}
EQU3=$(expr index $REM_2 '=')
COGNOMEN=${REM_2:$EQU3}

# Print out Cicero's full name
echo "Cicero's full Latin name was: $PRAENOMEN $NOMEN $COGNOMEN."


