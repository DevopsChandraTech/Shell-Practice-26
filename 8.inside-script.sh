#!/bin/bash

START_TIME=$(date +%s)
echo "the script start time:$START_TIME"
sleep 20

END_TIME=$(date +%s)
echo "the script end time:$END_TIME"

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "script execution time is $TOTAL_TIME Sec."