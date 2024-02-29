#!/bin/bash
mkdir five
for i in {1..5};do
    mkdir "five/dir$i"
    for j in {1..4};do
	file="five/dir$i/file$j"
	for k in $(seq 1 $j);do
	    echo "$j" >> $file
	done
    done
done

	     
