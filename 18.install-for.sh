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

# check application exist or not

dnf list installed mysql

if [ $? -ne 0 ]; then
    echo "Not Installed MySql Proceed With Installation."
    dnf install mysql -y
else 
    echo "MySql already exist...! Skipping..!"
fi

dnf list installed nginx

if [ $? -ne 0 ]; then
    echo "Not Installed Nginx Proceed With Installation."
    dnf install nginx -y
else 
    echo "Nginx already exist...! Skipping..!"
fi




