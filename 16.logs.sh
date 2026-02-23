#!/bin/bash
#install mysql nginx python onto server using shell script
#check user have root privilizes or not

USER_ID=$(id -u) # here id =0 root user otherthan 0 normal user
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USER_ID -ne 0 ]; then
    echo -e "$R ERROR $N:: Please run with root user privilizes."
    exit 1
fi

LOGS_FOLDER=/var/log/shell-script
SCRIPT_NAME=$($0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$R ERROR $N:: Please check once $R $2 $N Command Not found."
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    echo -e "$R ERROR $N:: $R $2 $N not installed proceed with installation"
    dnf install mysql -y &>> $LOG_FILE
    VALIDATE $? MySql
else 
    echo -e "$R SUCCESS $N:: $R $2 $N already installed $R Skipping $N"
fi


dnf list installed nginx
if [ $? -ne 0 ]; then
    echo -e "$R ERROR $N:: $R $2 $N not installed proceed with installation"
    dnf install nginx -y &>> $LOG_FILE
    VALIDATE $? Nginx
else 
    echo -e "$R SUCCESS $N:: $R $2 $N already installed $R Skipping $N"
fi
