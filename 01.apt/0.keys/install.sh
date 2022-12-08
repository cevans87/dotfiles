#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )
TD=/usr/share/keyrings

echo ">>> Apt keys"
sudo mkdir -pv /usr/share/keyrings
for D in ${DS[@]} ; do
    if [ -d $D ] ; then
        for RF in $(find $D -type f | xargs realpath --relative-to=$D) ; do
            sudo cp -v --remove-destination $D/$RF $TD/$RF
        done
    fi
done
echo "<<< Apt keys"