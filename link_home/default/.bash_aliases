if [ -f $HOME/.bash_aliases.$HOSTNAME ] ; then
    . $HOME/.bash_aliases.$HOSTNAME
fi
if [ -f $HOME/.bash_aliases.$USER ] ; then
    . $HOME/.bash_aliases.$USER
fi
