#!/bin/bash

set -e

echo ">>> Docker post-install"
if [ -z $(id -Gn | grep -o docker) ] ; then
    sudo groupadd docker
    sudo adduser $USER docker
    newgrp docker
fi
echo "<<< Docker post-install"
