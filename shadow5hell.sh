#!/bin/bash

# Ask user if Shadow Terminal should run
read -p "Enable Shadow Terminal? (y/n): " SHADOW_CHOICE

if [[ "$SHADOW_CHOICE" == "y" ]]; then

LOG_DIR="$HOME/.shadow_logs"
mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/shadow_$(date +%F_%H-%M-%S).log"
ZIP_FILE="$LOG_FILE.zip"

# Ask password silently
read -s -p "Enter Shadow_Log Password: " ZIP_PASS
echo

LAST_CMD=""

shadow_log() {

    cmd=$(history 1 | sed 's/^[ ]*[0-9]\+[ ]*//')

    # ignore empty commands
    [[ -z "$cmd" ]] && return

    # ignore duplicate command
    [[ "$cmd" == "$LAST_CMD" ]] && return

    LAST_CMD="$cmd"

    {
        echo "-----------------------------------"
        echo "TIME    : $(date)"
        echo "USER    : $USER"
        echo "DIR     : $PWD"
        echo "COMMAND : $cmd"
        echo "OUTPUT  :"
    } >> "$LOG_FILE"
}

# log command before execution
trap shadow_log DEBUG

# capture output
exec > >(tee -a "$LOG_FILE") 2>&1

compress_log() {

    if [ -f "$LOG_FILE" ]; then
        cd "$LOG_DIR" || exit
        zip -j -P "$ZIP_PASS" "$(basename "$ZIP_FILE")" "$(basename "$LOG_FILE")" > /dev/null 2>&1
        rm "$LOG_FILE"
    fi
}

# compress when terminal exits
trap compress_log EXIT

fi
