#!/bin/bash

set -e

BD="$(dirname "$(realpath "$0")")"

sudo apt update
"$BD"/../../vs.sh "$BD" | "$BD"/../../reduce.sh "sudo apt install -y --no-install-recommends"
