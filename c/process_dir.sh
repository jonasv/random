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

# Function to process files
process_file() {
    local file="$1"
    # Check if it's a regular file
    if [ -f "$file" ]; then
        # Call the C application with the full path of the file
        ./mini_checksumer "$file"
    fi
}

# Function to process directories recursively
process_directory() {
    local dir="$1"
    # Use find to get all files and directories
    find "$dir" -print0 | while IFS= read -r -d '' item; do
        if [ -f "$item" ]; then
            process_file "$item"
        fi
    done
}

# Start processing from the provided directory
process_directory "$1"

