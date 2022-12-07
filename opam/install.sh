#!/bin/bash

set -e

BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

echo ">>> Opam"
for D in ${DS[@]} ; do
    if [ -d $D ] ; then
        opam install -y $(eval echo $(cat $D/*))
    fi
done
echo "<<< opam"
