#!/bin/bash

set -e

_CWD=$CWD
trap 'dirs -c && cd $_CWD' exit

BD=$(dirname $(realpath $0))

echo ">>> Snaps"
pushd $BD > /dev/null
FS=( $BD/default $BD/$(whoami) $BD/$(hostname) )
for F in ${FS[@]} ; do
    if [ -f $F ] ; then
        for S in $(cat $F) ; do
            sudo snap install --classic $S
        done
    fi
done
popd > /dev/null
echo "<<< Snaps"