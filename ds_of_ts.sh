#!/usr/bin/env bash

set -e

mapfile -t TS -u 1

DS=()
for T in "${TS[@]}" ; do
    D="$1/$T"
    if [ -d "$D" ] ; then
        DS+=("$(realpath "$D")")
    fi
done

if [ -n "${DS[*]}" ] ; then
    echo "$(IFS="${2-$'\n'}"; echo "${DS[*]}")"
fi
