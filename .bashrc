# Turn on advanced bash completion if the file exists
if [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

export MANPATH="/usr/local/man:$MANPATH"
export VIRTUALENVWRAPPER_PYTHON=$(which python3)

# Load in .bashrc -------------------------------------------------
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then

  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/Workspace  # Not very important -- mkproject command uses this

  source /usr/local/bin/virtualenvwrapper.sh

  export VIRTUALENV_USE_DISTRIBUTE=true

  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  export PIP_REQUIRE_VIRTUALENV=true
  export PIP_RESPECT_VIRTUALENV=true
fi
