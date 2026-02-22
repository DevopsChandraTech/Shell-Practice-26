#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: user has no root priviliges run with root user priviliges"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: NOT INSTALLING MYSQL"
else 
    echo "SUCCESS:: PROCEED WITH INSTALLATION"
fi
