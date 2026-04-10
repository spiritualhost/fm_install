#!/usr/bin/env bash

#Test if running interactively (TTY)
if [ -t 0 ]; then
    echo "Running in an interactive terminal."
else    
    echo "Input is piped or from a file."
fi 

# Install custom package