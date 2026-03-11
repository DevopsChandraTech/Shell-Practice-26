#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)

while IFS= read -r line
do
    echo line: $line | awk '{ print $7 }'


done <<< $DISK_USAGE