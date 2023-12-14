#!/usr/bin/env bash

set -e

mapfile -t DS -u 1

FS=()
for D in "${DS[@]}" ; do
    mapfile -t -O "${#FS[@]}" FS < <(find "$D" -type f)
done

if [ -n "${FS[*]}" ] ; then
    echo "$(IFS="${2-$'\n'}"; echo "${FS[*]}")"
fi
