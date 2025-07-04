#!/bin/bash

# Check if a directory path is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Check if the provided path is a directory
if [ ! -d "$1" ]; then
    echo "Error: '$1' is not a directory"
    exit 1
fi

TMPFILE=$(mktemp)

# Function to process a single file
process_file() {
    local file="$1"
    if [ -f "$file" ]; then
        mini_checksumer "$file" >> "$TMPFILE"
    fi
}

# Use find to process all files recursively
find "$1" -type f -print0 | while IFS= read -r -d '' file; do
    process_file "$file"
done

# Sort the results and output to stdout
sort "$TMPFILE"
rm "$TMPFILE"
