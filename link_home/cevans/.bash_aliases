pushd $HOME/.dotfiles > /dev/null
export DOTFILES_URL=$(git remote get-url origin 2> /dev/null || :)
export DOTFILES_HASH=$(git rev-parse origin/master 2> /dev/null || :)
popd > /dev/null

if [ -f $HOME/.bash_aliases.$HOSTNAME ] ; then
    . $HOME/.bash_aliases.$HOSTNAME
fi
