#!/bin/bash

read -p "Enter choice (1-3): " choice

case $choice in
    1)
        echo "new file content" >> forcasefile
        ;;
    2)
        read -p "dir name: " dirname
        mkdir "$dirname"
        echo "directory created: $dirname"
        ;;
    3)
        ls -l
        ;;
    *)
        echo "invalid"
        ;;
esac
~    
output >> 


root@DESKTOP-16I2ULB:/mnt/c/Users/nikhi/telco/day9# ./case.sh
Enter choice (1-3): 1
root@DESKTOP-16I2ULB:/mnt/c/Users/nikhi/telco/day9# ./case.sh
Enter choice (1-3): 2
dir name: forgit
directory created: forgit
root@DESKTOP-16I2ULB:/mnt/c/Users/nikhi/telco/day9# ./case.sh
Enter choice (1-3): 3
total 24
-rwxrwxrwx 1 root root   59 Nov 20 11:34 1
-rwxrwxrwx 1 root root   38 Nov 20 12:02 1234.sh
-rwxrwxrwx 1 root root   61 Nov 20 10:47 3rd.sh
-rwxrwxrwx 1 root root    0 Nov 19 09:58 a.txt
-rwxrwxrwx 1 root root   38 Nov 20 12:44 add.sh
-rwxrwxrwx 1 root root  406 Nov 20 16:50 age.sh
-rwxrwxrwx 1 root root   33 Nov 20 12:03 allfiles.sh~                              
