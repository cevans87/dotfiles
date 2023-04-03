#!/bin/bash

set -e

echo ">>> Docker post-install"
if [ -z $(id -Gn | grep -o docker) ] ; then
    sudo usermod -aG docker $(whoami)
    newgrp docker
fi
echo "<<< Docker post-install"
