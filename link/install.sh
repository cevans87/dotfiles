#!/bin/bash

set -e

_CWD=$CWD
trap 'dirs -c && cd $_CWD' exit

BD=$(dirname $(realpath $0))

echo ">>> Link home"
pushd $BD > /dev/null
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )
for D in ${DS[@]} ; do
    if [ -d $D ] ; then
        for RF in $(find $D -type f | sed "s/^\.\///" | xargs realpath --relative-to=$D) ; do
            ln -fsv $D/$RF $HOME/$RF
        done
    fi
done
popd > /dev/null
echo "<<< Link home"