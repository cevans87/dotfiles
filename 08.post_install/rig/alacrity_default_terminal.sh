#!/bin/bash

set -e

sudo update-alternatives --install \
        /usr/bin/x-terminal-emulator \
        x-terminal-emulator \
        $HOME/.local/bin/alacritty \
        100
