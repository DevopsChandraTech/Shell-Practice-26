#!/bin/bash
# mysql installation
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: Proceed User with Root Priviliges"
    exit 1 #if other than 0 it is failure
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Command mysql Not Found,Please Check and Try Again"
    exit 1 #if other than 0 it is failure
else 
    echo "SUCCESS:: Proceed with Installation"
fi

#nginx installation

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: Proceed User with Root Priviliges"
    exit 1 #if other than 0 it is failure
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Command nginx Not Found,Please Check and Try Again"
    exit 1 #if other than 0 it is failure
else 
    echo "SUCCESS:: Proceed with Installation"
fi

#mongodb client installation

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: Proceed User with Root Priviliges"
    exit 1 #if other than 0 it is failure
fi

dnf install mongodb-mongosh -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Command mongosh Not Found,Please Check and Try Again"
    exit 1 #if other than 0 it is failure
else 
    echo "SUCCESS:: Proceed with Installation"
fi


