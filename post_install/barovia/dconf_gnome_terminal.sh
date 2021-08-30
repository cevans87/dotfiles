#!/bin/bash

set -e

echo ">>> Dconf gnome terminal"
# Settings generated with `dconf dump /org/gnome/terminal/`
echo "$(cat <<-EOM
[legacy]
theme-variant='dark'

[legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9]
audible-bell=false
background-color='rgb(23,20,33)'
bold-is-bright=true
font='JetBrains Mono 11'
foreground-color='rgb(208,207,204)'
use-theme-colors=false
EOM
)" | tee >(dconf load /org/gnome/terminal/)
echo "<<< Dconf gnome terminal"
