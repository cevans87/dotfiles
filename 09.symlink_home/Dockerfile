ARG BASE=ubuntu:rolling
ARG LATEST=base

FROM ${BASE} AS base
ARG USER
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        ca-certificates \
        sudo \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -l -m -U -G sudo -s /bin/bash ${USER} \
    && echo "${USER} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

FROM ${LATEST} AS latest
ARG USER
USER ${USER}
WORKDIR /home/${USER}
RUN yes | sudo unminimize

COPY --chown=${USER}:${USER} /.dotfiles/00.pre_install .dotfiles/00.pre_install
RUN .dotfiles/00.pre_install/install.sh

COPY --chown=${USER}:${USER} /.dotfiles/01.apt/0.keys .dotfiles/01.apt/0.keys
RUN .dotfiles/01.apt/0.keys/install.sh

COPY --chown=${USER}:${USER} /.dotfiles/01.apt/1.sources .dotfiles/01.apt/1.sources
RUN .dotfiles/01.apt/1.sources/install.sh

COPY --chown=${USER}:${USER} /.dotfiles/01.apt/2.packages .dotfiles/01.apt/2.packages
RUN .dotfiles/01.apt/2.packages/install.sh

COPY --chown=${USER}:${USER} /.dotfiles/02.git/0.clones .dotfiles/02.git/0.clones
RUN .dotfiles/02.git/0.clones/install.sh

COPY --chown=${USER}:${USER} /.dotfiles/02.git/1.remotes .dotfiles/02.git/1.remotes
RUN .dotfiles/02.git/1.remotes/install.sh

COPY --chown=${USER}:${USER} /.dotfiles/03.pip .dotfiles/03.pip
RUN .dotfiles/03.pip/install.sh

COPY --chown=${USER}:${USER} /.dotfiles/04.cargo .dotfiles/04.cargo
RUN .dotfiles/04.cargo/install.sh

COPY --chown=${USER}:${USER} /.dotfiles/05.opam .dotfiles/05.opam
RUN .dotfiles/05.opam/install.sh

COPY --chown=${USER}:${USER} /.dotfiles/06.copy .dotfiles/06.copy
RUN .dotfiles/06.copy/install.sh

COPY --chown=${USER}:${USER} /.dotfiles/07.hardlink_home .dotfiles/07.hardlink_home
RUN .dotfiles/07.hardlink_home/install.sh

COPY --chown=${USER}:${USER} /.dotfiles/08.symlink .dotfiles/08.symlink
RUN .dotfiles/08.symlink/install.sh

COPY --chown=${USER}:${USER} /.dotfiles/09.symlink_home .dotfiles/09.symlink_home
RUN .dotfiles/09.symlink_home/install.sh

COPY --chown=${USER}:${USER} /.dotfiles/10.snaps .dotfiles/10.snaps
RUN .dotfiles/10.snaps/install.sh

COPY --chown=${USER}:${USER} /.dotfiles/11.post_install .dotfiles/11.post_install
RUN .dotfiles/11.post_install/install.sh
