#!/bin/bash

set -e

BD="$(dirname "$(realpath "$0")")"
mapfile -t DS  < <("$BD"/../../ds.sh "$BD")

for D in "${DS[@]}" ; do
    mapfile -t FS < <(find "$D" -type f)
    for F in "${FS[@]}" ; do
        TF="/etc/apt/sources.list.d/$(realpath --relative-to "$D" "$F")"
        sudo rm -fv "$TF"
        while read -r L ; do
            eval echo "$L" | sudo tee -a "$TF"
        done < "$F"
    done
done
