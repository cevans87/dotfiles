#!/bin/bash

set -e

BD=$(dirname $(realpath $0))

for RF in $( find -type f -name install.sh | xargs realpath --relative-to=$BD | sort -n) ; do
    if [ $RF != "install.sh" ] ; then
        $RF
    fi
done
