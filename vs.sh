#!/usr/bin/env bash

set -e

BD="$(dirname "$(realpath "$0")")"

mapfile -t FS < <("$BD"/fs.sh "$1")

if [ -n "${FS[*]}" ] ; then
    echo "$(IFS="${2-$'\n'}"; echo "${FS[*]}")" | "$BD"/vs_of_fs.sh
fi
