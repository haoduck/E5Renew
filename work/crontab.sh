#!/bin/sh
min=1000
max=9999
rand_time=$(($RANDOM*$RANDOM%$(($max-$min+1))+$min))
echo "sleep ${rand_time}s"
sleep ${rand_time}s
python /work/index.py
