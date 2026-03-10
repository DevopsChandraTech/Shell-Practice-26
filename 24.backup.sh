#!/bin/bash
#install mysql nginx python onto server using shell script
#check user have root privilizes or not

USER_ID=$(id -u) # here id =0 root user otherthan 0 normal user
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER=/var/log/shell-script
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER
SOURCE_DIR=$1
DESTINATION_DIR=$2
echo "this folder is executed by $(date)"

if [ $USER_ID -ne 0 ]; then
    echo -e "$R ERROR $N:: Please run with root user privilizes."
    exit 1
fi

# the special variable how many arguments passed into script $#

# SOURCE_DIR=$(find <LOGS_DIR> -name <name of file> -type f -mtime +14)
# DESTINATION_DIR=$(DEST_DIR)

USAGE(){
    echo "24.backup.sh <source directory> <destination directory> <no.of days>(optional) default is 14days>"
}

if [ $# -lt 2 ]; then
    echo -e "ERROR:: Pass Source and Destination arguments."
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
    echo -e "$R Source $SOURCE_DIR does not exist $N"
    exit 1
fi

if [ ! -d $DESTINATION_DIR ]
    echo "$R destination $DESTINATION_DIR does not exist $N"
    exit 1
fi

