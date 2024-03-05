#!/bin/bash


usage() {
    echo "Usage: $0 <column> [file.csv]"
    echo "  Reads the specified column from the CSV file and calculates its mean."
    echo "  If [file.csv] is not provided, reads from stdin."
    echo "  Example: $0 3 mtcars.csv"
}

# Check for correct number of arguments
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    usage 1>&2
    exit 1
fi

# Assign command-line arguments to variables
column="$1"
file="${2:-/dev/stdin}"

mean=$(cut -d ',' -f "$column" "$file" | tail -n +2 | {
    sum=0
    count=0
    while read -r value; do
        sum=$((sum + value))
        count=$((count + 1))
    done
    if [ "$count" -gt 0 ]; then
        echo "$((sum / count))"
    fi
})

echo "Mean of column $column in file '$file': $mean"
