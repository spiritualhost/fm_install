#!/usr/bin/env bash

# Open the file explorer (Finder) to select the FileMaker DMG file
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

# Get the mount path from /Volumes/
if [ $? -eq 0 ]; then
    MOUNT_PATH=$(echo "$MOUNT_OUTPUT" | grep -o '/Volumes/File.*')
    echo "DMG Mounted Successfully at $MOUNT_PATH. Examining file contents."
else
    echo "Error mounting DMG: $?"
    exit 1
fi

#Create a working folder
mkdir -p working/

# List the files in the directory
rsync -av "$MOUNT_PATH"/* working/ || (echo "Error copying app bundle" && exit 1)

#Have user grab the license certificate
LICENSE_CERT=$(osascript -e 'POSIX path of (choose file with prompt "Select the FileMaker License Certificate")')

# Check if the user cancelled the script
if [ -z "$LICENSE_CERT" ]; then
    echo "No file selected."
    exit 1
else
    echo "You selected $LICENSE_CERT"
fi

# Unmount the DMG
hdiutil detach "$MOUNT_PATH"