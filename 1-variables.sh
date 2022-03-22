#!/usr/bin/bash
# Practice fun with variables!

BIRTHDATE="Aug 24, 1971"

Presents=10

BIRTHDAY=$(date -d "$BIRTHDATE" +%A)

echo "I was born on $BIRTHDAY, $BIRTHDATE. This time around on my birthday, I got $Presents presents."
