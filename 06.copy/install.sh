#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

echo ">>> Copy"
for D in ${DS[@]} ; do
    if [ -d $D ] ; then
        for RF in $(find $D -type f | xargs realpath --relative-to=$D) ; do
            sudo mkdir -pv $(dirname /$RF)
            sudo cp -v --remove-destination $D/$RF /$RF
        done
    fi
done
echo "<<< Copy"
