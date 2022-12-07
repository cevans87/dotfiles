FROM branchtaken/hemlock:base AS hemlock
ARG HEMLOCK_USER=hemlock
USER ${HEMLOCK_USER}
WORKDIR /home/${HEMLOCK_USER}
COPY --chown=${HEMLOCK_USER}:${HEMLOCK_USER} ./.dotfiles /home/${HEMLOCK_USER}/.dotfiles
RUN .dotfiles/install.sh
CMD [ "/usr/bin/tmux" ]
