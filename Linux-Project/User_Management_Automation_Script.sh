#!/bin/bash

# Check root
if [ "$EUID" -ne 0 ]; then
  echo "Run as root (sudo)"
  exit
fi

echo "1. Add User"
echo "2. Delete User"
echo "3. Create Group"
echo "4. Add User to Group"
echo "5. Backup Directory"
echo "6. Exit"

read -p "Enter choice: " choice

if [ "$choice" -eq 1 ]; then
    read -p "Enter username: " username
    useradd -m $username
    passwd $username
    echo "User created"

elif [ "$choice" -eq 2 ]; then
    read -p "Enter username: " username
    userdel -r $username
    echo "User deleted"

elif [ "$choice" -eq 3 ]; then
    read -p "Enter group name: " groupname
    groupadd $groupname
    echo "Group created"

elif [ "$choice" -eq 4 ]; then
    read -p "Enter username: " username
    read -p "Enter group name: " groupname
    usermod -aG $groupname $username
    echo "User added to group"

elif [ "$choice" -eq 5 ]; then
    read -p "Enter directory to backup: " dir
    read -p "Enter backup location: " dest
    tar -czvf $dest/backup.tar.gz $dir
    echo "Backup completed"

elif [ "$choice" -eq 6 ]; then
    echo "Exit"

else
    echo "Invalid choice"
fi
