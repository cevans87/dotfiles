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
    && echo "${USER} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && yes | unminimize

FROM ${LATEST} AS latest
ARG USER
USER ${USER}
WORKDIR /home/${USER}
RUN yes | sudo unminimize
COPY --chown=${USER}:${USER} /.dotfiles/ .dotfiles
RUN .dotfiles/install.sh
