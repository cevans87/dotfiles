#!/bin/bash

set -e

IFS=$'\n'
BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

echo ">>> Git clones"
for D in ${DS[@]} ; do
    if [ -d $D ] ; then
        for RF in $(find $D -type f | xargs realpath --relative-to=$D) ; do
            if [ ! -d $HOME/$RF ] ; then
                mkdir -pv $HOME/$RF
                for L in $(cat $D/$RF) ; do
                    git clone $(eval echo $L) $HOME/$RF
                done
            fi
        done
    fi
done
echo "<<< Git clones"
