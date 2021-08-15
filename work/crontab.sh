#!/bin/sh
rand_time=$(rand_time=$(min=1000;max=9999;expr $(date +%N) %  $(($max - $min  + 1)) + $min))
echo "sleep ${rand_time}s"
sleep ${rand_time}s
python /work/index.py