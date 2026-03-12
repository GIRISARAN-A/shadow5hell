#!/bin/bash

echo "Shadow Terminal Logger Installer"
echo "--------------------------------"

SCRIPT_PATH="$(pwd)/shadow5hell.sh"

# Check if script exists
if [ ! -f "$SCRIPT_PATH" ]; then
    echo "shadow5hell.sh not found in current directory."
    exit 1
fi

# Detect shell config file
if [ -f "$HOME/.bashrc" ]; then
    RC_FILE="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    RC_FILE="$HOME/.zshrc"
elif [ -f "$HOME/.bash_profile" ]; then
    RC_FILE="$HOME/.bash_profile"
else
    RC_FILE="$HOME/.profile"
fi

echo "Detected shell config file: $RC_FILE"

# Prevent duplicate installation
if grep -q "shadow5hell.sh" "$RC_FILE"; then
    echo "Shadow Logger already installed."
    exit 0
fi

echo "Installing..."

echo "" >> "$RC_FILE"
echo "# Shadow Terminal Logger" >> "$RC_FILE"
echo "source \"$SCRIPT_PATH\"" >> "$RC_FILE"

echo "Installation completed."
echo "Restart terminal or run:"
echo "source $RC_FILE"
