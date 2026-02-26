#!/bin/bash
# check user has root access or not
# check application installed or not
# check command correct or not
# install the application
# given colours to success or failures
# create directory for logs and store those logs into that
# 

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

# check application exist or not

dnf list installed mysql

if [ $? -ne 0 ]; then
    echo -e "Not Installed $R $2 $N Proceed With Installation."
    dnf install mysql -y &>> $LOG_FILE
    VALIDATE $? MySql
else 
    echo -e "$2 already exist...! $Y Skipping..! $N" &>> $LOG_FILE
fi

dnf list installed nginx

if [ $? -ne 0 ]; then
    echo -e "Not Installed $R $2 $N Proceed With Installation."
    dnf install nginx -y &>> $LOG_FILE
    VALIDATE $? Nginx
else 
    echo -e "$2 already exist...! $Y Skipping..! $N" &>> $LOG_FILE
fi

dnf list installed python3

if [ $? -ne 0 ]; then
    echo -e "Not Installed $R $2 $N Proceed With Installation."
    dnf install python3 -y &>> $LOG_FILE
    VALIDATE $? Python
else 
    echo -e "$2 already exist...!  $Y Skipping..! $N" &>> $LOG_FILE
fi


