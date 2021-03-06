#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

echo ">>> Link"
for D in ${DS[@]} ; do
    if [ -d $D ] ; then
        for RF in $(find $D -type l,f | xargs realpath --no-symlinks --relative-to=$D) ; do
            sudo mkdir -pv $(dirname $RF)
            sudo ln -fsv $D/$RF /$RF
        done
    fi
done
echo "<<< Link"
