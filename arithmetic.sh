#!/bin/bash

VAL=`expr 2 + 2`; echo "Total value: $VAL";

# Arithmetic operations
A=10; B=20;
VAL_1=`expr $A + $B`; echo "Addition gives: $VAL_1"; echo "Addition gives: `expr $A + $B`";

# Substraction
VAL_2=`expr $A - $B`; echo "Substraction gives: $VAL_2"; echo "Substraction gives: `expr $A - $B`"

# Division
VAL_3=`expr $B / $A`; echo "Division gives: $VAL_3"; echo "Division gives: `expr $B / $A`";

# Multiplication
VAL_4=`expr $A \* $B`; echo "Multplication gives: $VAL_4"; echo "Multiplcation gives: `expr $A \* $B`";

# Modulus
VAL_5=`expr $B % $A`; echo "Modulus gives: $VAL_5"; echo "Modulus gives: `expr $B % $A`";

# Assignment
VAL_6=$A; echo "Assignment gives: $VAL_6";

# # Equality
if [ $A == $B ]; then
  echo "A is equal to B"
else
  echo "A is not equal to B"
fi

echo $? # exot code
