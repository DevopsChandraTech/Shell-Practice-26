#!/bin/bash

START_TIME=$(date +%s)
END_TIME=$(date +%s)
TOTAL_TIME=$(($END-TIME-$START-TIME))

echo "the script start time is:$START_TIME"

sleep 10

echo "the script end time is:$END_TIME"

echo "script execution time is $TOTAL_TIME Sec."