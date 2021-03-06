#!/bin/dash

i=1
max=10
count=0
while test $i -le $max
do
    count=`expr $count + 1`  # increment number
done

echo $count

