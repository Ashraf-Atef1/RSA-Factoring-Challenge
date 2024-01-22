#!/bin/bash
mapfile -t lines < $1
for line in "${lines[@]}"; do
	factor=$(factor $line)
	IFS=" " read -ra my_array <<< "$factor"
	num1="${my_array[1]}"
    echo $line=$(($line / $num1))*$num1
done
