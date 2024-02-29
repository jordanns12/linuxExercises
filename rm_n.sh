#!/bin/bash

# rm_n.sh - Removes all files in a directory larger than specified size

# Usage statement
usage() {
    echo "Usage: $0 <dir> <n>"
    echo "  Removes all files in directory <dir> larger than <n> bytes."
    echo "  Example: $0 five 3"
}

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
    usage 1>&2
    exit 1
fi

# Validate that second argument is a positive integer
if ! [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Second argument must be a positive integer." 1>&2
    usage 1>&2
    exit 1
fi

# Execute find command to remove files
find "$1" -type f -size +"$2"c -exec rm -f {} \;

echo "Files larger than $2 bytes in directory '$1' have been removed."

