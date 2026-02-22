#!/bin/bash
USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USER_ID -ne 0 ]; then
    echo -e "$R ERROR $N:: RUN COMMAND WITH ROOT USER PRIVILIGES."
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$R ERROR $N:: $2 Command Not Found, Please Check Syntax Once."
        exit 1
    else 
        echo -e "$G Success $N:: Proceed with $2 Installation."
    fi
}
dnf list installed mysql
if [ $? -ne 0 ]; then
    echo -e "$R $2 $N not installed Proceed with Installation"
    dnf install mysql -y
    VALIDATE $? "MySql"
else 
    echo -e "$2 already exist..! $Y Skipping $N"
fi

dnf list installed mysql
if [ $? -ne 0 ]; then
    echo -e "$R $2 $N not installed Proceed with Installation"
    dnf install nginx -y
    VALIDATE $? "Nginx"
else 
    echo -e "$2 already exist..! $Y Skipping $N"
fi

dnf list installed mysql
if [ $? -ne 0 ]; then
    echo -e "$R $2 $N not installed Proceed with Installation"
    dnf install python3 -y
    VALIDATE $? "Python"
else 
    echo -e "$2 already exist..! $Y Skipping $N"
fi
