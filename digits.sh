#!/bin/bash
sum=0

for i in {1000..2000}; do
    if [[ $i=~^[01]+$ ]]; then
        sum=$((sum+i))
    fi
done

echo "The sum of numbers between 1000 and 2000 having digits only from {0,1} is: $sum"

