#!/bin/bash

set -e

echo ">>> Ssh add"
if [ -z "$(ssh-add -L | grep "$(cat $HOME/.ssh/id_ed25519.pub)")" ] ; then
    ssh-add -v $HOME/.ssh/id_ed25519
fi
echo "<<< Ssh add"
