#!/bin/bash
# Loops
#1 While loop 2: The for loop 3: The until loop 4: select loop

# Example 1: while loop
a=0;
while [ $a -lt 10 ];
do
  b="$a";
  while [ $b -ge 0 ]
  do
    echo -n "$b ";
    b=`expr $b - 1`;
  done;
  echo
  a=`expr $a + 1`;
done;

# Example 2:  Until loop

c=0;
while [ $c -lt 10 ]
do
  echo $c;
  if [ $c -eq 5 ]
  then
    break;
  fi;
  c=`expr $c + 1`;
done;

# echo $?; #End of execution

# Example 3: For loop
for var_1 in 1 2 3;
do
  for var_2 in 0 5;
  do
    if [ $var_1 -eq 2 -a $var_2 -eq 0 ]
    then
      break 2;
    else
      echo "[$var_1, $var_2]";
    fi;
  done;
done;

# Continue statement

NUMS="1 2 3 4 5 6 7 "
for NUM in $NUMS;
do
  Q=`expr $NUM % 2`
  if [ $Q -eq 0 ]
  then
    echo "Number is not an even number!!.";
    continue;
  fi;
  echo "Found odd number.";
done;
