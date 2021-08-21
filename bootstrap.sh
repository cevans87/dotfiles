#!/bin/bash

set -e

BD=$(dirname $(realpath $0))

$BD/apt/install.sh
$BD/copy/install.sh
$BD/copy_home/install.sh
$BD/link/install.sh
$BD/link_home/install.sh
$BD/snaps/install.sh
