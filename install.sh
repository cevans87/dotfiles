#!/bin/bash

set -e

BD=$(dirname $(realpath $0))

$BD/pre_install/install.sh
$BD/apt/install.sh
$BD/git/install.sh
$BD/cargo/install.sh
$BD/opam/install.sh
$BD/copy/install.sh
$BD/hardlink_home/install.sh
$BD/symlink/install.sh
$BD/symlink_home/install.sh
$BD/snaps/install.sh
$BD/post_install/install.sh
