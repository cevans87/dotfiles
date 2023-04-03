#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )
TD=/usr/share/keyrings

sudo mkdir -pv ${TD}
for D in ${DS[@]} ; do
    if [ -d $D ] && [ ! -z "$(ls -A $D)" ] ; then
        for RF in $(find $D -type f | xargs realpath --relative-to=$D) ; do
            sudo cp -v --remove-destination $D/$RF $TD/$RF
        done
    fi
done