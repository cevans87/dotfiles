#!/bin/bash

set -e

_CWD=$CWD
trap 'dirs -c && cd $_CWD' exit

BD=$(dirname $(realpath $0))

echo ">>> Apt packages"
pushd $BD > /dev/null
FS=( $BD/default $BD/$(whoami) $BD/$(hostname) )
for F in ${FS[@]} ; do
    if [ -f $F ] ; then
        xargs -a $F sudo apt-get install -y --no-install-recommends
    fi
done
popd > /dev/null
echo "<<< Apt packages"