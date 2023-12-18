#!/usr/bin/env bash

set -e

mapfile -t XS -u 1

CS=()
if [ -n "${XS[*]}" ] ; then
    CS+=("${XS[0]}")
    for X in "${XS[@]:1}" ; do
        CS+=("${2- }" "$X")
    done
    
    eval "$1" "$(IFS=""; echo "${CS[@]}")"
fi
