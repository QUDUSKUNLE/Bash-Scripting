# !/bin/bash

# Define a function to check if a file exists
Hello () {
  echo "Hello World";
}

# Invoke function Hello
Hello;

# Invoke a function with parameters

Okay () {
  echo "Okay, sir $1, $2."
  return 10;
}

Okay "John" "Doe";

# Captures value returned by function
ret=$?

echo "Return value is $ret.";

# Calling one function from another
number_one () {
  echo "This is the first function speaking...";
  number_two;
}

number_two () {
  echo "This is now the second function speaking...";
}

number_one;
