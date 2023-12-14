#!/usr/bin/env bash

set -e

BD="$(dirname "$(realpath "$0")")"

"$BD"/fs.sh "$1" | "$BD"/vs_of_fs.sh
