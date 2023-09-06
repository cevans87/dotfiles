#!/bin/bash

set -e

if [ -z $(id -Gn | grep -o docker) ] ; then
    sudo groupadd docker
    sudo usermod -aG docker $(whoami)
    newgrp docker
fi
