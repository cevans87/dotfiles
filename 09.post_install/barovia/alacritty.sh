#!/bin/bash

set -e

echo ">>> Alacritty default terminal"
sudo update-alternatives --install \
        /usr/bin/x-terminal-emulator \
        x-terminal-emulator \
        $HOME/.local/bin/alacritty \
        100
echo "<<< Alacritty default terminal"
