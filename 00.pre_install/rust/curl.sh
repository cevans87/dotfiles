#!/bin/env bash

set -e

sudo apt update
sudo apt install --no-install-recommends -y curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
