# syntax=docker/dockerfile-upstream:master-labs
ARG BASE=ubuntu:rolling
ARG PLATFORM=${BUILDPLATFORM}
ARG LATEST=base

FROM --platform=${PLATFORM} ${BASE} AS base
ARG USER
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        ca-certificates \
        locales \
        sudo \
    && rm -rf /var/lib/apt/lists/ \
    && groupmod -n ${USER} ubuntu \
    && usermod -d /home/${USER} -c "" -l ${USER} ubuntu \
    && echo "${USER} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen

FROM --platform=${PLATFORM} ${LATEST} AS latest
ARG USER
USER ${USER}
WORKDIR /home/${USER}
RUN yes | sudo unminimize

ENV LC_ALL=

ENV BD=.dotfiles
COPY --chown=${USER}:${USER} --link --parents ${BD}/*.sh /home/${USER}

ENV BD=.dotfiles/00.pre_install
COPY --chown=${USER}:${USER} --link --parents ${BD} /home/${USER}
RUN --mount=type=ssh ${BD}/install.sh

ENV BD=.dotfiles/01.apt/0.keys
COPY --chown=${USER}:${USER} --link --parents ${BD} /home/${USER}
RUN --mount=type=ssh ${BD}/install.sh

ENV BD=.dotfiles/01.apt/1.sources
COPY --chown=${USER}:${USER} --link --parents ${BD} /home/${USER}
RUN --mount=type=ssh ${BD}/install.sh

ENV BD=.dotfiles/01.apt/2.packages
COPY --chown=${USER}:${USER} --link --parents ${BD} /home/${USER}
RUN --mount=type=ssh ${BD}/install.sh

ENV BD=.dotfiles/02.git/0.clones
COPY --chown=${USER}:${USER} --link --parents ${BD} /home/${USER}
RUN --mount=type=ssh ${BD}/install.sh

ENV BD=.dotfiles/02.git/1.remotes
COPY --chown=${USER}:${USER} --link --parents ${BD} /home/${USER}
RUN --mount=type=ssh ${BD}/install.sh

ENV BD=.dotfiles/03.pip
COPY --chown=${USER}:${USER} --link --parents ${BD} /home/${USER}
RUN --mount=type=ssh ${BD}/install.sh

ENV BD=.dotfiles/04.cargo
COPY --chown=${USER}:${USER} --link --parents ${BD} /home/${USER}
RUN --mount=type=ssh ${BD}/install.sh

ENV BD=.dotfiles/05.opam
COPY --chown=${USER}:${USER} --link --parents ${BD} /home/${USER}
RUN --mount=type=ssh ${BD}/install.sh

ENV BD=.dotfiles/06.snaps
COPY --chown=${USER}:${USER} --link --parents ${BD} /home/${USER}
RUN --mount=type=ssh ${BD}/install.sh

ENV BD=.dotfiles/07.symlink/1.root
COPY --chown=${USER}:${USER} --link --parents ${BD} /home/${USER}
RUN --mount=type=ssh ${BD}/install.sh

ENV BD=.dotfiles/07.symlink/2.home
COPY --chown=${USER}:${USER} --link --parents ${BD} /home/${USER}
RUN --mount=type=ssh ${BD}/install.sh

ENV BD=.dotfiles/08.post_install
COPY --chown=${USER}:${USER} --link --parents ${BD} /home/${USER}
RUN --mount=type=ssh ${BD}/install.sh
