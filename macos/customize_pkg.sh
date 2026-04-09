#!/usr/bin/env bash

# Open the file explorer (Finder) to select a file
FILE_PATH=$(osascript -e 'POSIX path of (choose file with prompt "Select the FileMaker Pro DMG: ")')

# Check if the user cancelled the script
if [ -z "$FILE_PATH" ]; then
    echo "No file selected."
else
    echo "You selected $FILE_PATH"
fi