#!/bin/sh
startDate=`date +"%Y-%m-%d %H:%M:%S"`
echo "Start: [$startDate]——————sleep ${rand_time}s"

min=1000
max=9999
rand_time=$(($RANDOM*$RANDOM%$(($max-$min+1))+$min))
sleep ${rand_time}s
python /work/index.py

echo "----------------------------------------------------------------------------"
endDate=`date +"%Y-%m-%d %H:%M:%S"`
echo "★[$endDate] Successful"
echo "----------------------------------------------------------------------------"
