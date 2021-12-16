FROM cevans87/aoc21:os AS aoc21
ARG AOC21_USER
USER ${AOC21_USER}
WORKDIR /home/${AOC21_USER}
COPY --chown=${AOC21_USER}:${AOC21_USER} ./.dotfiles /home/${AOC21_USER}/.dotfiles
RUN .dotfiles/install.sh
COPY --chown=${AOC21_USER}:${AOC21_USER} --from=cevans87/aoc21:user \
    /home/${AOC21_USER} /home/${AOC21_USER}
CMD [ "/usr/bin/tmux" ]
