#!/bin/bash

echo "Installing Shadow Terminal..."

cp shadow5hell.sh ~/.shadow5hell.sh

echo "" >> ~/.bashrc
echo "# Shadow Terminal Logger" >> ~/.bashrc
echo "source ~/.shadow5hell.sh" >> ~/.bashrc

echo "Installation complete!"
echo "Restart terminal to activate."
