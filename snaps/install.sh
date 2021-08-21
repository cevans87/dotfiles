#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
FS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

echo ">>> Snaps"
for F in ${FS[@]} ; do
    if [ -f $F ] ; then
        for S in $(eval echo $(cat $F)) ; do
            sudo snap install --classic $S
        done
    fi
done
echo "<<< Snaps"