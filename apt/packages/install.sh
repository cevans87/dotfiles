#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
FS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

echo ">>> Apt packages"
sudo apt-get update
for F in ${FS[@]} ; do
    if [ -f $F ] ; then
        sudo apt-get install -y --no-install-recommends $(eval echo $(cat $F))
    fi
done
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
echo "<<< Apt packages"