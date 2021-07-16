#!/bin/bash

# With the help of -e, it would print a new line else nothing
a=10;
echo -e "Value of a is $a \n";


#  Command substitution
Date=`date`;
echo "Today's date is $Date.";

USERS=`who | wc -l`;
echo "Logged in users are: $USERS.";

UP=`date ; uptime`;
echo "Uptime is: $UP";
