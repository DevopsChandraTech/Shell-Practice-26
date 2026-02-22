#!/bin/bash
NUMBER1=100
NUMBER2=200
NAME="DevOps"

SUM=$(($NUMBER1+$NUMBER2+$NAME))

echo "SUM IS:${SUM}"

LEADERS=${"Modi","Putin","Trump","Chang"}

echo "all leaders: ${LEADERS[@]}"
echo "first leader: ${LEADERS[0]}"
echo "second leader: ${LEADERS[1]}"
echo "third leader: ${LEADERS[2]}"
