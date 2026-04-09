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
MOUNT_OUTPUT=$(hdiutil attach "$DMG_PATH" -nobrowse)

#Get the mount path from /Volumes/
if [ $? -eq 0 ]; then
    MOUNT_PATH=$(echo "$MOUNT_OUTPUT" | grep -o '/Volumes/File.*')
    echo "DMG Mounted Successfully at $MOUNT_PATH. Examining file contents."
else
    echo "Error mounting DMG: $?"
    exit 1
fi

echo $MOUNT_PATH

# List the files in the directory
#ls -lh /Volumes/MountedVolumeName

#Unmount the DMG
#hdiutil detach /Volumes/MountedVolumeName