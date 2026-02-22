#!/bin/bash
# eq = equal
# -lt = less than
# -gt = greater than
# -ne = not equal 

echo "pls enter the number"
read NUMBER
NUMBER=$1
if [ $NUMBER -gt 10 ]; then
    echo "given number greater than 10"
elif [ $NUMBER -eq 10 ]; then
    echo "given number is equal to 10"
else 
    echo "given number less than 10"
fi