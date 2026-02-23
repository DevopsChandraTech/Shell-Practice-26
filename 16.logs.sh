#!/bin/bash
#install mysql nginx python onto server using shell script
#check user have root privilizes or not
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USER_ID=$(id -u) # here id =0 root user otherthan 0 normal user

if [ $USER_ID -ne 0]; then
    echo "ERROR:: Please run with root user privilizes."
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$R ERROR $N:: Please check once $2 Command Not found."
        exit 1
    else 
        echo "$R SUCCESS $N:: Proceed With $2 Installation."
    fi
}

dnf install mysql -y 
VALIDATE $? MySql

dnf install nginx -y 
VALIDATE $? Nginx
