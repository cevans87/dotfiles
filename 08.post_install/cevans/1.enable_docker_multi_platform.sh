#!/bin/bash

set -e

docker container prune -f
sudo docker run --privileged --rm tonistiigi/binfmt --install all
