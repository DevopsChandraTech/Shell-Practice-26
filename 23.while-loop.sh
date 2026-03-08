#!/bin/bash
#syntax
# while [ expression ]
# do
#     command to be executed
# done

count=5

echo "Startig countdown"

while [ $count -gt 0 ]
do
    echo "Time left in $count"
    sleep 1
    count=$((count - 1))
done

echo "TimesUp"