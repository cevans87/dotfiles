#!/bin/bash

set -e

if [ -z $(id -Gn | grep -o docker) ] ; then
    sudo usermod -aG docker $(whoami)
    newgrp docker
fi
