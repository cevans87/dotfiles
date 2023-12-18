#!/bin/bash

set -e

BD="$(dirname "$(realpath "$0")")"

"$BD"/../vs.sh "$BD" | "$BD"/../reduce.sh "python3 -m pip install --break-system-packages --user"
