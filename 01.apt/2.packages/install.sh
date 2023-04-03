#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

sudo apt-get update
for D in ${DS[@]} ; do
    if [ -d $D ] && [ ! -z "$(ls -A $D)" ] ; then
        sudo apt-get install -y --no-install-recommends $(eval echo $(cat $D/*))
    fi
done
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
