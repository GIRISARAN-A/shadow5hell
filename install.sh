#!/bin/bash

echo "Installing Shadow Terminal..."

cp shadow_terminal.sh ~/.shadow_terminal.sh

echo "" >> ~/.bashrc
echo "# Shadow Terminal Logger" >> ~/.bashrc
echo "source ~/.shadow_terminal.sh" >> ~/.bashrc

echo "Installation complete!"
echo "Restart terminal to activate."
