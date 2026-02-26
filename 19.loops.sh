#!/bin/bash
for package in $@;
do
    package $package
done