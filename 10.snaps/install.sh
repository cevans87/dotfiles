#!/bin/bash

set -e

IFS=$'\n'
BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

echo ">>> Snaps"
for D in ${DS[@]} ; do
    if [ -d $D ] ; then
        for L in $(cat $D/*) ; do
            sudo snap install --classic $(eval echo $L)
        done
    fi
done
echo "<<< Snaps"
