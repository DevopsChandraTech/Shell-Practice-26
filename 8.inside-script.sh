#!/bin/bash

START-DATE=$(date +%s)
END-DATE=$(date +%s)
TOTAL-TIME=$(($START-DATE-$END-DATE))

echo "the script start time is: $START-DATE"

sleep 10

echo "the script end time is: $END-DATE"

echo "script execution time is $TOTAL-TIME Sec."