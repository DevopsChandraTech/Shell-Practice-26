#!/bin/bash
echo "all variables running into script:$@"
echo "all variables running into script:$*"
echo "name of the script:$0"
echo "who is running the script:$USER"
echo "script current working directory:$PWD"
echo "script current home folder:$HOME"
echo "script process id:$$"
sleep 10 & # this command running in baground
echo "last running command PID:$!"