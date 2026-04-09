#!/usr/bin/env bash

# Open the file explorer (Finder) to select a file
FILE_PATH=$(osascript -e 'POSIX path of (choose file with prompt "Select the FileMaker Pro DMG: ")')

