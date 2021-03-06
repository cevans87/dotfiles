#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

echo ">>> Pre install"
for D in ${DS[@]} ; do
    if [ -d $D ] ; then
        for RF in $(find $D -type f | xargs realpath --relative-to=$D) ; do
            $D/$RF
        done
    fi
done
echo "<<< Pre install"
