#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=3
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
MESSAGE=""

while IFS= read -r line
do
   USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
   PARTITION=$(echo $line | awk '{print $7}' | cut -d "%" -f1)
   if [ $USAGE -ge $THRESHOLD ]; then
        MESSAGE="High Disk Usage On $PARTITION = $USAGE %" #here + symbol is append lines
   fi

done <<< $DISK_USAGE

echo "Message Body = $MESSAGE"