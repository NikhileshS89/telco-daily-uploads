#!/bin/bash

# Prompt the user to enter their age
read -p "enter your age:" age

# Use the =~ operator for regular expression matching
# Checks if the name contains ONLY numbers
if [[ "$age" =~ ^[0-9]+$ ]] && (( age > 0 && age < 100 )); then
    # If the age is valid (matches the pattern)
    echo $age
else
    # If the age is invalid (contains alphabates, symbols, etc.)
    echo "invalid"
fi
~      

output>>>

root@DESKTOP-16I2ULB:/mnt/c/Users/nikhi/telco/day9# ./age.sh
enter your age:15
15
