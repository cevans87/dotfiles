#!/bin/bash

BD=$(dirname $(realpath $0))

mkdir -p $BD/05.opam/$1
mkdir -p $BD/06.snaps/$1
mkdir -p $BD/08.post_install/$1
mkdir -p $BD/03.pip/$1
mkdir -p $BD/00.pre_install/$1
mkdir -p $BD/02.git/1.remotes/$1
mkdir -p $BD/02.git/0.clones/$1
mkdir -p $BD/07.symlink/1.root/$1
mkdir -p $BD/07.symlink/2.home/$1
mkdir -p $BD/01.apt/0.keys/$1
mkdir -p $BD/01.apt/1.sources/$1
mkdir -p $BD/01.apt/2.packages/$1
mkdir -p $BD/04.cargo/$1

