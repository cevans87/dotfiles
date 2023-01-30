#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

echo ">>> Symlink home"
for D in ${DS[@]} ; do
    if [ -d $D ] ; then
        for RF in $(find $D -type l,f | xargs realpath --no-symlinks --relative-to=$D) ; do
            mkdir -pv $(dirname $HOME/$RF)
            ln -frsv $D/$RF $HOME/$RF
        done
    fi
done
echo "<<< Symlink home"
