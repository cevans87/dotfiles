#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

echo ">>> Pip"
for D in ${DS[@]} ; do
    if [ -d $D ] ; then
        python3 -m pip install --user $(eval echo $(cat $D/*))
    fi
done
echo "<<< Pip"
