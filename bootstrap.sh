#!/bin/bash

set -e

_CWD=$CWD
trap 'dirs -c && cd $_CWD' exit

BD=$(dirname $(realpath $0))

for F in $(find $BD -type f | sed "s/^\.\///" | grep -P "^.*/install.sh$") ; do
    $F
done