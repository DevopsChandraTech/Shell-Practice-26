#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
THRESHOLD=3

while IFS= read -r line
do
   USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
   PARTITION=$(echo $line | awk '{print $7}' | cut -d "%" -f1)
   if [ $USAGE -ge $THRESHOLD ]; then
    echo "High usage $PARTITION : $USAGE"
   fi

done <<< $DISK_USAGE