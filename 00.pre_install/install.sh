#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

for D in ${DS[@]} ; do
    if [ -d $D ] && [ ! -z "$(ls -A $D)" ] ; then
        for RF in $(find $D -type f | xargs realpath --relative-to=$D) ; do
            echo ">>> $D/$RF"
            $D/$RF
            echo "<<< $D/$RF"
        done
    fi
done
