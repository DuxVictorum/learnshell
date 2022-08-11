# Basic Structure of AWK
The awk program treats every line of text in a file as a separate record. It then splits that record / line into discrete fields (based on whitespace).

The most basic structure of an 'awk' command is:  
> ***pattern* { action }**

The awk language looks at every line in the file/input and processes it according to the pattern.  
**If the pattern matches the input, then the action is performed.**  
- If the pattern portion is left empty, the default pattern is to match the entire record.
- If the action portion is left empty (i.e. no square brackets at all), the default action is to print the entire record.  

Each field of a record can be referenced with `$1`, `$2`, `$3`, etc.  
You can use `$0` to signify the entire record / line.


---

# Patterns
Two important patterns are BEGIN and END.
- BEGIN signals the action to be taken before any lines are read.
- END signals the action to be taken after the last line is read.

---

# Actions

## Print
The most basic (indeed, the default) action is to print the record or (more commonly) a specific field. 
In this example, the **third column** of each record (row) will be printed.
> `awk '{ print $3 }'`  

## Variables
You can define variables inside the action section.  
It usually makes sense to define them in a `BEGIN` line:
> `BEGIN { x=5 }`

From this point on, `x` (rather than `$x` as in bash) equals 5.  
Thus in the following code example: `{ print x, $x }` the first 'x' prints out '5', whereas the second prints out the fifth field of the record being acted upon.    

*Note*: In awk, there is no variable expansion inside quotes. For example, `print $1` prints the first field, but `print "$1"` will just print out "$1."  


---

# Awk Extras: Tips & Tricks
1. **Make your awk script its own stand-alone executable**  
The awk program functions as an interpreter. This means that you can write an awk script, change its mode, and put it in the PATH *as long as* you add the following at top:  
`#!/bin/awk -f`
1. 

# Notes to organize later:
This is 