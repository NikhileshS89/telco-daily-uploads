#!/bin/bash

echo "--- File Management Menu ---"
echo "1) Create File"
echo "2) Delete File"
echo "3) Copy File (cp)"
echo "----------------------------"

# Prompt the user for input and store it in the 'choice' variable
read -p "Enter your choice (1, 2, or 3): " choice

# Start the case structure, evaluating the variable 'choice'
case $choice in
    1)
        ## Option 1: Create File
        read -p "Enter the name for the new file (e.g., newfile.txt): " new_filename
        
        # Use 'touch' to create an empty file, or '>' can be used as well
        touch "$new_filename"
        
        # Check if the command was successful
        if [ $? -eq 0 ]; then
            echo "✅ SUCCESS: File '$new_filename' created."
        else
            echo "❌ ERROR: Could not create file '$new_filename'."
        fi
        ;;

    2)
        ## Option 2: Delete File
        read -p "Enter the name of the file to delete: " delete_filename
        
        # Check if the file exists before attempting to delete it
        if [ -f "$delete_filename" ]; then
            rm "$delete_filename"
            echo "✅ SUCCESS: File '$delete_filename' deleted."
        else
            echo "⚠️ NOT FOUND: File '$delete_filename' does not exist in the current directory."
        fi
        ;;

    3)
        ## Option 3: Copy File
        read -p "Enter the SOURCE file path: " source_file
        read -p "Enter the DESTINATION path (file or directory): " destination_path

        # Check if the source file exists before copying
        if [ -f "$source_file" ]; then
            cp "$source_file" "$destination_path"
            
            # Check if the copy command was successful
            if [ $? -eq 0 ]; then
                echo "✅ SUCCESS: File '$source_file' copied to '$destination_path'."
            else
                echo "❌ ERROR: Copy failed. Check permissions or destination path."
            fi
        else
            echo "⚠️ NOT FOUND: Source file '$source_file' does not exist."
        fi
        ;;
        
    *)
        ## Default Case: Invalid input
        echo "❌ Invalid choice. Please enter 1, 2, or 3."
        ;;
esac

echo "--- Script finished. ---"


output >>

root@DESKTOP-16I2ULB:/mnt/c/Users/nikhi/telco/day9# ./filemanagement.sh
--- File Management Menu ---
1) Create File
2) Delete File
3) Copy File (cp)
----------------------------
Enter your choice (1, 2, or 3): 2
Enter the name of the file to delete: file4.txt
✅ SUCCESS: File 'file4.txt' deleted.
--- Script finished. ---
root@DESKTOP-16I2ULB:/mnt/c/Users/nikhi/telco/day9# ls
1        allfiles.sh  cp.sh          file2              ifelse.sh      nameage.sh  test.sh
1234.sh  b.txt        csv            file3              info.sh        nik         while1.sh
3rd.sh   c.txt        d.txt          filemanagement.sh  ip.sh          okkk        x.awk
a.txt    case.sh      dir2           forcasefile        jor.log        output      y.csv
add.sh   cat.sh       empty.sh       forgit             managment.txt  report.cpu  yesno.sh
age.sh   choice.sh    equalornot.sh  hotspot.sh         name.sh        shhh
root@DESKTOP-16I2ULB:/mnt/c/Users/nikhi/telco/day9# ./filemanagement.sh
--- File Management Menu ---
1) Create File
2) Delete File
3) Copy File (cp)
----------------------------
Enter your choice (1, 2, or 3): 2
Enter the name of the file to delete: file4.txt
⚠️ NOT FOUND: File 'file4.txt' does not exist in the current directory.
--- Script finished. ---
root@DESKTOP-16I2ULB:/mnt/c/Users/nikhi/telco/day9# ./filemanagement.sh
--- File Management Menu ---
1) Create File
2) Delete File
3) Copy File (cp)
----------------------------
Enter your choice (1, 2, or 3): 3
Enter the SOURCE file path: file3
Enter the DESTINATION path (file or directory): ^C
root@DESKTOP-16I2ULB:/mnt/c/Users/nikhi/telco/day9# ll
total 44
drwxrwxrwx 1 root root  4096 Nov 20 17:25 ./
drwxrwxrwx 1 root root  4096 Nov 19 15:51 ../
-rwxrwxrwx 1 root root 12288 Nov 20 15:19 .nameage.sh.swp*
drwxrwxrwx 1 root root  4096 Nov 19 09:27 .snapshots/
-rwxrwxrwx 1 root root    59 Nov 20 11:34 1*
-rwxrwxrwx 1 root root    38 Nov 20 12:02 1234.sh*
-rwxrwxrwx 1 root root    61 Nov 20 10:47 3rd.sh*
-rwxrwxrwx 1 root root     0 Nov 19 09:58 a.txt*
-rwxrwxrwx 1 root root    38 Nov 20 12:44 add.sh*
-rwxrwxrwx 1 root root   406 Nov 20 16:50 age.sh*
-rwxrwxrwx 1 root root    33 Nov 20 12:03 allfiles.sh*
-rwxrwxrwx 1 root root     0 Nov 19 09:58 b.txt*
-rwxrwxrwx 1 root root     0 Nov 19 09:58 c.txt*
-rwxrwxrwx 1 root root   334 Nov 20 16:55 case.sh*
-rwxrwxrwx 1 root root    43 Nov 20 12:06 cat.sh*
-rwxrwxrwx 1 root root   150 Nov 20 16:53 choice.sh*
-rwxrwxrwx 1 root root    60 Nov 20 12:52 cp.sh*
-rwxrwxrwx 1 root root    73 Nov 19 12:09 csv*
-rwxrwxrwx 1 root root     0 Nov 19 09:58 d.txt*
drwxrwxrwx 1 root root  4096 Nov 20 14:47 dir2/
-rwxrwxrwx 1 root root   120 Nov 20 12:01 empty.sh*
-rwxrwxrwx 1 root root   120 Nov 20 11:49 equalornot.sh*
-rwxrwxrwx 1 root root    18 Nov 20 12:51 file2*
-rwxrwxrwx 1 root root    18 Nov 20 12:52 file3*
-rwxrwxrwx 1 root root  2221 Nov 20 17:24 filemanagement.sh*
-rwxrwxrwx 1 root root    68 Nov 20 17:01 forcasefile*
drwxrwxrwx 1 root root  4096 Nov 20 17:01 forgit/
-rwxrwxrwx 1 root root  2556 Nov 20 16:36 hotspot.sh*
-rwxrwxrwx 1 root root    61 Nov 20 11:38 ifelse.sh*
-rwxrwxrwx 1 root root   326 Nov 20 17:18 info.sh*
-rwxrwxrwx 1 root root    49 Nov 20 12:24 ip.sh*
-rwxrwxrwx 1 root root  8218 Nov 19 09:56 jor.log*
-rwxrwxrwx 1 root root     0 Nov 20 17:07 managment.txt*
-rwxrwxrwx 1 root root    73 Nov 20 16:50 name.sh*
-rwxrwxrwx 1 root root   386 Nov 20 16:50 nameage.sh*
drwxrwxrwx 1 root root  4096 Nov 20 10:22 nik/
drwxrwxrwx 1 root root  4096 Nov 20 17:10 okkk/
-rwxrwxrwx 1 root root   250 Nov 19 10:19 output*
-rwxrwxrwx 1 root root  2702 Nov 20 14:11 report.cpu*
-rwxrwxrwx 1 root root     0 Nov 20 10:36 shhh*
-rwxrwxrwx 1 root root    98 Nov 20 10:01 test.sh*
-rwxrwxrwx 1 root root   107 Nov 20 12:19 while1.sh*
-rwxrwxrwx 1 root root    19 Nov 19 12:31 x.awk*
-rwxrwxrwx 1 root root   821 Nov 19 14:41 y.csv*
-rwxrwxrwx 1 root root    96 Nov 20 11:54 yesno.sh*
root@DESKTOP-16I2ULB:/mnt/c/Users/nikhi/telco/day9# ./filemanagement.sh
--- File Management Menu ---
1) Create File
2) Delete File
3) Copy File (cp)
----------------------------
Enter your choice (1, 2, or 3): 3
Enter the SOURCE file path: file3
Enter the DESTINATION path (file or directory): /forgit/file5           
cp: cannot create regular file '/forgit/file5': No such file or directory
❌ ERROR: Copy failed. Check permissions or destination path.
--- Script finished. ---
root@DESKTOP-16I2ULB:/mnt/c/Users/nikhi/telco/day9# ./filemanagement.sh
--- File Management Menu ---
1) Create File
2) Delete File
3) Copy File (cp)
----------------------------
Enter your choice (1, 2, or 3): 3
Enter the SOURCE file path: file3
Enter the DESTINATION path (file or directory): forgit/file5
✅ SUCCESS: File 'file3' copied to 'forgit/file5'.
--- Script finished. ---
root@DESKTOP-16I2ULB:/mnt/c/Users/nikhi/telco/day9# ls
1        allfiles.sh  cp.sh          file2              ifelse.sh      nameage.sh  test.sh
1234.sh  b.txt        csv            file3              info.sh        nik         while1.sh
3rd.sh   c.txt        d.txt          filemanagement.sh  ip.sh          okkk        x.awk
a.txt    case.sh      dir2           forcasefile        jor.log        output      y.csv
add.sh   cat.sh       empty.sh       forgit             managment.txt  report.cpu  yesno.sh
age.sh   choice.sh    equalornot.sh  hotspot.sh         name.sh        shhh
