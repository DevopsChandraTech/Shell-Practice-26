#!/bin/bash

USER_ID=$(id -u) # here id =0 root user otherthan 0 normal user
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f2)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.sh"

mkdir -p $LOG_FOLDER

echo "the script executed started at $(date)"
SOURCE_DIR=/home/ec2-user/app-logs

if [ ! -d SOURCE_DIR ]; then
    echo "ERROR:: $SOURCE_DIR does not exit"
else
    echo "SUCCESS:: $SOURCE_DIR exists %Y SKIPPING %N"
fi

