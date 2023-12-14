#!/bin/bash

set -e

BD="$(dirname "$(realpath "$0")")"
mapfile -t DS < <("$BD"/../ds.sh "$BD")

if [ -e "$SSH_AUTH_SOCK" ] ; then
    sudo chown "$(id -u)":"$(id -g)" "$SSH_AUTH_SOCK"
fi

# shellcheck disable=SC2174
mkdir -p -m 0700 ~/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts

for D in "${DS[@]}" ; do
    # shellcheck disable=SC2174
    mapfile -t FS < <(find "$D" -type f)
    for F in "${FS[@]}" ; do
        TD="$HOME/$(realpath --relative-to "$D" "$F")"
        if [ ! -d "$TD" ] ; then
            mkdir -pv "$TD"
            while read -r L ; do
                git clone "$(eval echo "$L")" "$TD"
            done < "$F"
        fi
    done
done
