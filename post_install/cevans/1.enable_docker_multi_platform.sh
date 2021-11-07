#!/bin/bash

set -e

echo ">>> Enable Docker multi-platform"
sudo docker run --privileged --rm tonistiigi/binfmt --install all
echo "<<< Enable Docker multi-platform"
