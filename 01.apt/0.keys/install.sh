#!/bin/bash

set -e

BD="$(dirname "$(realpath "$0")")"

"$BD"/../../fs.sh "$BD" \
    | "$BD"/../../map.sh "printf \"%s /usr/share/keyrings\"" \
    | "$BD"/../../reduce.sh "sudo cp -v --remove-destination"
