#!/bin/bash

set -e

BD=$(dirname $(realpath $0))

$BD/keys/install.sh
$BD/sources/install.sh
$BD/packages/install.sh