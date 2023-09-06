if [ -f ~/.bash_aliases.$(hostname) ] ; then
    . ~/.bash_aliases.$(hostname)
fi
if [ -f ~/.bash_aliases.$(whoami) ] ; then
    . ~/.bash_aliases.$(whoami)
fi

export PATH="$HOME"/.local/bin:"$PATH"
