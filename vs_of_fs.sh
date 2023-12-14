#!/usr/bin/env bash

set -e

mapfile -t FS -u 1

VS=()
for F in "${FS[@]}" ; do
    while read -r V ; do
        if [ -n "$V" ] ; then
            VS+=("$(eval echo "$V")")
        fi
    done < "$F"
done

VS=( "$(echo "${VS[*]}" | tr ' ' '\n' | sort | uniq)" )

if [ -n "${VS[*]}" ] ; then
    echo "$(IFS="${2-$'\n'}"; echo "${VS[*]}")"
fi
