#!/bin/bash

set -e

BD=$(dirname $(realpath $0))

$BD/clones/install.sh
$BD/remotes/install.sh
