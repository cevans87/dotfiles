#!/bin/bash

set -e

BD="$(dirname "$(realpath "$0")")"

"$BD"/../vs.sh "$BD" | "$BD"/../reduce.sh "cargo install"
