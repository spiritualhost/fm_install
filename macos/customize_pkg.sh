#!/usr/bin/env bash

# Open the file explorer (Finder) to select a file
DMG_PATH=$(osascript -e 'POSIX path of (choose file with prompt "Select the FileMaker Pro DMG")')

# Check if the user cancelled the script
if [ -z "$DMG_PATH" ]; then
    echo "No file selected."
    exit 1
else
    echo "You selected $DMG_PATH"
fi

# Mount the DMG
if MOUNT_PATH=$(hdiutil attach "$DMG_PATH" -nobrowse | grep -o '/Volumes/.*/'); then
    echo "DMG Mounted Successfully. Examining file contents."
else
    echo "Error mounting DMG: $?"
    exit 1
fi

echo $MOUNT_PATH

# List the files in the directory
#ls -lh /Volumes/MountedVolumeName

#Unmount the DMG
#hdiutil detach /Volumes/MountedVolumeName