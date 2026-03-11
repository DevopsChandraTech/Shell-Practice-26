#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
THRESHOLD=3

while IFS= read -r line
do
   USAGE=$(echo $line | awk '{print $6}')
   PARTITION=$(echo $line | awk '{print $7}')
   if [ $USAGE -ge $THRESHOLD ]; then
    echo "High usage $PARTITION : $USAGE"
   fi

done <<< $DISK_USAGE