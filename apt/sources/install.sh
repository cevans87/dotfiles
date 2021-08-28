#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )
TD=/etc/apt/sources.list.d

echo ">>> Apt sources"
sudo mkdir -pv $TD
for D in ${DS[@]} ; do
    if [ -d $D ] ; then
        for RF in $(find $D -type f | xargs realpath --relative-to=$D) ; do
            sudo rm -fv $TD/$RF
            # RF must end in a newline for final line to be processed
            cat $D/$RF | while read -r L ; do
                echo $(eval echo $L) | sudo tee -a $TD/$RF
            done
        done
    fi
done
echo "<<< Apt sources"