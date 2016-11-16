# Turn on advanced bash completion if the file exists
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="/usr/local/man:$MANPATH"
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_NDK_HOME=/urs/local/opt/android-ndk

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
