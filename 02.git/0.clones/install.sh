#!/bin/bash

set -e

IFS=$'\n'
BD=$(dirname $(realpath $0))
DS=( $BD/default $BD/$(whoami) $BD/$(hostname) )

if [ -e "$SSH_AUTH_SOCK" ] ; then
    sudo chown $(id -u):$(id -g) $SSH_AUTH_SOCK
fi
mkdir -p -m 0700 ~/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts
for D in ${DS[@]} ; do
    if [ -d $D ] && [ ! -z "$(ls -A $D)" ] ; then
        for RF in $(find $D -type f | xargs realpath --relative-to=$D) ; do
            if [ ! -d $HOME/$RF ] ; then
                mkdir -pv $HOME/$RF
                for L in $(cat $D/$RF) ; do
                    git clone $(eval echo $L) $HOME/$RF
                done
            fi
        done
    fi
done
