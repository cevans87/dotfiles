#!/bin/bash

set -e

_CWD=$CWD
trap 'dirs -c && cd $_CWD' exit

BD=$(dirname $(realpath $0))

echo ">>> Apt keys"
pushd $BD > /dev/null
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )
for D in ${DS[@]} ; do
    if [ -d $D ] ; then
        sudo cp -v --remove-destination $D/* /usr/share/keyrings
    fi
done
popd > /dev/null
echo "<<< Apt keys"