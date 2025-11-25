#!/bin/bash

# Prompt the user to enter their name
read -p "enter your name:" name

# Use the =~ operator for regular expression matching
# Checks if the name contains ONLY letters and spaces
if [[ "$name" =~ ^[a-zA-Z\_]+$ ]]; then
    # If the name is valid (matches the pattern)
    echo $name
else
    # If the name is invalid (contains numbers, symbols, etc.)
    echo "invalid"
fi
~              

output>>


root@DESKTOP-16I2ULB:/mnt/c/Users/nikhi/telco/day9# ./nameage.sh
enter your name:nik
nik
