#!/bin/bash

set -e

echo ">>> Alacritty default terminal"
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $HOME/.local/bin/alacritty
echo "<<< Alacritty default terminal"
