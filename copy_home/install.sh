#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

echo ">>> Copy home"
for D in ${DS[@]} ; do
    if [ -d $D ] ; then
        for RF in $(find $D -type f | xargs realpath --relative-to=$D) ; do
            mkdir -pv $(dirname $HOME/$RF)
            cp -v --remove-destination $D/$RF $HOME/$RF
        done
    fi
done
echo "<<< Copy home"