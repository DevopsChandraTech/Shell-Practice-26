#!/bin/bash
# mysql installation
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: Proceed User with Root Priviliges"
    exit 1 #if other than 0 it is failure
fi

VALIDATE() { #functions receives inputs through args, just like shell script args.
    if [ $1 -ne 0 ]; then
        echo "ERROR:: Command $2 Not Found,Please Check and Try Again"
        exit 1 #if other than 0 it is failure
    else 
        echo "SUCCESS:: Proceed with $2 Installation"
    fi
}

VALIDATE $? "MYSQL"
dnf install mysql -y

VALIDATE $? "Nginx"
dnf install nginx -y

VALIDATE $? "Python"
dnf install python3 -y






