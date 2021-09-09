#!/bin/bash

set -e

echo ">>> Enable ssh-agent"
systemctl --user enable ssh-agent
echo "<<< Enable ssh-agent"
