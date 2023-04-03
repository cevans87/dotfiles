#!/bin/bash

set -e

IFS=$'\n'
BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

for D in ${DS[@]} ; do
    if [ -d $D ] && [ ! -z "$(ls -A $D)" ] ; then
        for L in $(cat $D/*) ; do
            echo $(eval echo $L) | xargs git clone
        done
    fi
done
