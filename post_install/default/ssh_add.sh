#!/bin/bash

set -e

if [ -z "$(ssh-add -L | grep "$(cat $HOME/.ssh/id_ed25519.pub)")" ] ; then
    ssh-add -v $HOME/.ssh/id_ed25519
fi
