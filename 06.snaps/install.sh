#!/bin/bash

set -e

BD="$(dirname "$(realpath "$0")")"

"$BD"/../vs.sh "$BD" | "$BD"/../map.sh "sudo snap install --classic"
