#!/bin/bash

set -e

# shellcheck disable=SC2143
if [ -z "$(id -Gn | grep -o docker)" ] ; then
    sudo groupadd docker
    sudo usermod -aG docker "$(whoami)"
    newgrp docker
fi
