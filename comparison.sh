#!/bin/bash

read -p "Enter first string: " var_1;
read -p "Enter second string: " var_2;

if [[ $var_1 == $var_2 ]];
then
  echo "Strings are equal.";
else
  echo "Strings are not equal.";
fi;
 
# Alternatively
[[ ${var_1} == ${var_2} ]] && echo "Equal" || echo "Not equal";

echo ${var:-"Varibale is not set"}; # Variable is not set;
echo "1 - Value of var is ${var}";

echo ${var:="Variable is not set"}; # Variable is not set;
echo "2 - Value of var is ${var}";

unset var;
echo ${var:+"This is default value"}; # Unset var
echo "3 - Value of var is ${var}";

var="Prefix";
echo ${var:+"This default value"};
echo "4 - Value of var is ${var}";

echo ${var:?"Print this message"};
echo "5 - Value of var is ${var}";

# echo ${var_2}
