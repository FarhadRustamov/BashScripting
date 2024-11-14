#!/bin/bash

mult=1
sum=0

if (( $1 % 2 == 0 )); then
	for number in $(seq 1 $(($1/2))); do
		((mult *= $number))
	done
	for number in $(seq $(($1/2 + 1)) $1); do
		((sum += $number))
	done
elif (( $1 % 2 != 0 )); then
	for number in $(seq 1 $(($1/2))); do
		((mult *= $number))
	done
	for number in $(seq $((($1/2)+2)) $1); do
		((sum += $number))
	done
fi

echo "mult: $mult"
echo "sum:  $sum"
