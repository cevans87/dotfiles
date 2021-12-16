#!/bin/bash

set -e

BD=$(dirname $(realpath $0))

$BD/pre_install/install.sh
$BD/apt/install.sh
$BD/git/install.sh
$BD/cargo/install.sh
$BD/copy/install.sh
$BD/copy_home/install.sh
$BD/link/install.sh
$BD/link_home/install.sh
$BD/snaps/install.sh
$BD/post_install/install.sh
