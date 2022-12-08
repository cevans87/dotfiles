#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

echo ">>> Cargo"
for D in ${DS[@]} ; do
    if [ -d $D ] ; then
        for S in $(eval echo $(cat $D/*)) ; do
            cargo install $S
        done
    fi
done
echo "<<< Cargo"
