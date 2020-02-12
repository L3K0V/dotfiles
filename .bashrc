# Turn on advanced bash completion if the file exists
if [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

export MANPATH="/usr/local/man:$MANPATH"