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
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER
echo "this folder is executed by $(date)"

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$R ERROR $N:: Please check once $R $2 $N Command Not found."
        exit 1
    fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
    echo -e "$R Installing $N:: MySql | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? MySql
else 
    echo -e "MySql already exist..! $R Skipping $N" | tee -a $LOG_FILE
fi


dnf list installed nginx&>>$LOG_FILE
if [ $? -ne 0 ]; then
    echo -e "$R Installing $N:: Nginx | tee -a $LOG_FILE
    dnf install nginx -y &>> $LOG_FILE
    VALIDATE $? Nginx
else 
    echo -e "Nginx already exist..! $R Skipping $N" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    echo -e "$R Installing $N:: Python" | tee -a $LOG_FILE
    dnf install python3 -y &>> $LOG_FILE
    VALIDATE $? Python
else 
    echo -e "Python already exist..! $R Skipping $N" | tee -a $LOG_FILE
fi
