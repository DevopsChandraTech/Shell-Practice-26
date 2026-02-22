#!/bin/bash
USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USER_ID -ne 0 ]; then
    echo "$RERROR$N:: RUN COMMAND WITH ROOT USER PRIVILIGES."
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$RERROR$N:: $2 Command Not Found, Please Check Syntax Once."
    else 
        echo "$GSuccess$N:: Proceed with $2 Installation."
    fi
}
dnf list installed mysql
if [ $? -ne 0 ]; then
    echo "$R$2$N not installed Proceed with Installation"
    dnf install mysql -y
    VALIDATE $? "MySql"
else 
    "$2 already exist..! $YSkipping$N"

dnf list installed mysql
if [ $? -ne 0 ]; then
    echo "$R$2$N not installed Proceed with Installation"
    dnf install nginx -y
    VALIDATE $? "Nginx"
else 
    "$2 already exist..! $YSkipping$N"

dnf list installed mysql
if [ $? -ne 0 ]; then
    echo "$R$2$N not installed Proceed with Installation"
    dnf install python3 -y
    VALIDATE $? "Python"
else 
    "$2 already exist..! $YSkipping$N"
