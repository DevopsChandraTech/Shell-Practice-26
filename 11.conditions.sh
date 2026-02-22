#!/bin/bash
# eq = equal
# -lt = less than
# -gt = greater than
# -ne = not equal 

echo "pls enter the number"
read NUMBER
NUMBER=$1
if [ $NUMBER -gt 10 ];then
    echo "given number greaterthan 10"
elif [ $NUMBER -eq 10 ];then
    echo "given number is equal to 10"
else 
    echo "given number lessthan 10"
fi