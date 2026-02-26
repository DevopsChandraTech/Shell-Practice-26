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

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Error::Command Not Found Plese check once the command"
        exit 1
    fi
}

# check application exist or not

dnf list installed mysql

if [ $? -ne 0 ]; then
    echo "Not Installed $2 Proceed With Installation."
    dnf install mysql -y
    VALIDATE $? MySql
else 
    echo "$2 already exist...! Skipping..!"
fi

dnf list installed nginx

if [ $? -ne 0 ]; then
    echo "Not Installed $2 Proceed With Installation."
    dnf install nginx -y
    VALIDATE $? Nginx
else 
    echo "$2 already exist...! Skipping..!"
fi

dnf list installed python3

if [ $? -ne 0 ]; then
    echo "Not Installed $2 Proceed With Installation."
    dnf install python3 -y
    VALIDATE $? Python
else 
    echo "$2 already exist...! Skipping..!"
fi


