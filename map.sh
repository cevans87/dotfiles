#!/bin/bash

set -e

mapfile -t XS -u 1

for X in "${XS[@]}" ; do
    eval "$1" "$X"
done
