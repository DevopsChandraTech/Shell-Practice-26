#!/bin/bash
for package in $@;
do
    # check package status
    dnf list installed $package
    if [ $? -ne 0 ]; then
        echo "$G Installing::$N $package..!"
    else 
        echo "$package already exist $Y Skipping...! $N"
    fi
done