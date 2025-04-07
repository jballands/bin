#!/bin/bash

# Default to current directory if no path argument provided
TARGET_DIR="${1:-.}"

# Default directory name to search for, or use the second argument if provided
DIR_NAME="${2:-node_modules}"

# Check if the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' does not exist."
    exit 1
fi

echo "Searching for '$DIR_NAME' directories in '$TARGET_DIR'..."

# Find all specified directories and display them
# Using -not -path to exclude nested instances
found_dirs=$(find "$TARGET_DIR" -type d -name "$DIR_NAME" -not -path "*/$DIR_NAME/*/$DIR_NAME" -print)

if [ -z "$found_dirs" ]; then
    echo "No '$DIR_NAME' directories found."
    exit 0
fi

# Display the directories found
echo "Found the following directories:"
echo "$found_dirs"

# Count found directories
dir_count=$(echo "$found_dirs" | wc -l)
echo "Found $dir_count '$DIR_NAME' directories."

# Ask for confirmation
echo "Do you want to delete all these '$DIR_NAME' directories? (y/n)"
read -r confirmation

if [ "$confirmation" != "y" ] && [ "$confirmation" != "Y" ]; then
    exit 0
fi

# Remove the directories
echo "Deleting '$DIR_NAME' directories..."
echo "$found_dirs" | xargs rm -rf
echo "Done."
