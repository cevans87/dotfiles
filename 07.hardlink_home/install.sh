#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

for D in ${DS[@]} ; do
    if [ -d $D ] && [ ! -z "$(ls -A $D)" ] ; then
        for RF in $(find $D -type l,f | xargs realpath --no-symlinks --relative-to=$D) ; do
            mkdir -pv $(dirname $HOME/$RF)
            ln -fv $D/$RF $HOME/$RF
        done
    fi
done
