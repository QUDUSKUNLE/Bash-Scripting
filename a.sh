#!/bin/sh

# Author: Qudus Yekeen
_NAME='Qudus Yekeen'
echo "What is your name?"
read PERSON
echo "Hello, $_NAME."
echo "Hello, Mr. $PERSON."

echo "File Name: $0"
echo "First Parameter : $1"
echo "Second Parameter : $2"
echo "Quoted Values: $@"
echo "Quoted Values: $*"
echo "Total Number of Parameters : $#"

for TOKEN in $@
do
  echo $TOKEN
done

NAME[0]='Zara'
NAME[1]='Zainab'
NAME[2]='Ayan'

echo "First Index: ${NAME[0]}"
echo "Second Index: ${NAME[1]}"
echo "${NAME[*]}"
echo "${NAME[@]}"
echo $(whoami)
echo $?
