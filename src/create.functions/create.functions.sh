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
