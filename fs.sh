#!/usr/bin/env bash

set -e

BD="$(dirname "$(realpath "$0")")"
mapfile -t DS < <("$BD"/ds.sh "$1")

if [ -n "${DS[*]}" ] ; then
    echo "$(IFS="${2-$'\n'}"; echo "${DS[*]}")" | "$BD"/fs_of_ds.sh
fi
