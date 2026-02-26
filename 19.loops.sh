#!/bin/bash
# check user has root access or not
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "Error:: Run Command With Root User Privilizes."
    exit 1
fi

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f2)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.sh"
mkdir -p /var/log/shell-script


VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Error::Command Not Found Plese check once the command"
        exit 1
    fi
}

for package in $@;
do
    # check package status
    dnf list installed $package
    if [ $? -ne 0 ]; then
        echo -e "$G Installing::$N $package..!"
    else 
        echo -e "$package already exist $Y Skipping...! $N"
    fi
done