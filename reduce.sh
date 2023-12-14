#!/usr/bin/env bash

set -e

mapfile -t XS -u 1

if [ -n "${XS[*]}" ] ; then
    eval "$1" "$(IFS="${2- }"; echo "${XS[@]}")"
fi
