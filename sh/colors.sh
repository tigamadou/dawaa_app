#!/bin/bash

# ANSI color codes
# Determine OS and set color codes using tput
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    RESET=$(tput sgr0)
else
    # Linux and others
    RED="\033[0;31m"
    GREEN="\033[0;32m"
    YELLOW="\033[0;33m"
    RESET="\033[0m"
fi