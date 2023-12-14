#!/usr/bin/env bash

set -e

BD="$(dirname "$(realpath "$0")")"

"$BD"/ts.sh | "$BD"/ds_of_ts.sh "$1"
