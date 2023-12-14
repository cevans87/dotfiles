#!/bin/bash

set -e

BD="$(dirname "$(realpath "$0")")"
mapfile -t DS < <("$BD"/../../ds.sh "$BD")

for D in "${DS[@]}" ; do
    # shellcheck disable=SC2174
    mapfile -t FS < <(find "$D" -type f)
    for F in "${FS[@]}" ; do
        TF="$HOME/$(realpath --relative-to "$D" "$F")"
        mkdir -pv "$(dirname "$TF")"
        ln -fsv "$F" "$TF"
    done
done
