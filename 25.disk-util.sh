#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)

while IFS= read -r line
do
   echo "$line | awk '{print $6}'"
done <<< $DISK_USAGE