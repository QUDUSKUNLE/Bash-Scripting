#!/bin/sh 
#  Shebang commands

NAME="Abu Muhsinah"
echo "What is your name?"
read PERSON
echo "Hello, $PERSON"
# unset NAME
echo $NAME
echo $0 # Current file
echo $$ # Process number PID number
echo $# # Number of arguments supplied
# echo $1 # First paramter
# echo $2 # Second parameter
echo $* # All parameter received
echo $@ # All parameter received
date

for TOKEN in $*
do 
  echo "The first token: $TOKEN"
done

val=`expr 2 + 2`
echo $val

# Numeric operators
a=10
b=10
if [ $a == $b ]
then
  echo "a is equal to b"
else
  echo "a is not equal to b"
fi

# String operators
c="ade"
d="Boluwatife"
if [ $c = $d ]
then
  echo "c is equals to d"
else 
  echo "c is not equals to d"
fi

if [ -z $c ] # Check if the length of the string variable is zero
then
  echo true
else
  echo false
fi

e="okay"
if [ $e ]
then
  echo true
else
  echo false
fi

# Reading file properties
file="/Users/andeladeveloper/D3/shell/app.sh"

if [ -f $file -a -r $file -a -w $file -a -x $file ]
then
  echo "File has read, write and executable accesses"
else
  echo "File does not have read access"
fi

echo $? # exit code
