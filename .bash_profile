# lazy_loader.sh
# Copyright 2018 Terrance Kennedy
# MIT License, http://www.opensource.org/licenses/mit-license.php

# Defer initialization steps until one or more trigger commands is invoked.
#
# Usage: lazy_load <initialization_function> <cmd1> [ <cmd2> [..] ]
#
# Given an initialization_function and a list of commands that depend on that
# initialization_function, lazy_load creates a stub for each command that runs
# the initialization_function before invoking the command. It also unloads the
# stub, so the next time the command is ran, it's ran directly.
function lazy_load() {
    if [ $# -lt 2 ]; then
        echo "Usage: lazy_load <initialization_function> <cmd> [ <cmd2> [..] ]"
        return
    fi

    # name of the function that will be called to initialize the tool
    local init_func=$1
    shift
    # one or more commands to trigger initialization of the tool
    local cmd_list=( "$@" )

    # create a stub function for each command
    for cmd in "${cmd_list[@]}"; do
        # define cmd as a function
        eval "function $cmd() {
            echo \"Lazy loading $cmd...\"
            # destroy all stub functions related to init_func
            unset -f ${cmd_list[@]}
            # run init_func
            $init_func
            # run the command this stub was wrapping
            $cmd \$@
        }"
    done
}

# Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"

export PATH="/usr/sbin:/sbin:$PATH"              # 8
export PATH="/usr/bin:/bin:$PATH"                # 7
export PATH="$HOME/.fastlane/bin:$PATH"          # 6
export PATH="$HOME/opt/local/bin:$PATH"          # 5
export PATH="/usr/local/bin:$PATH"               # 4
export PYENV_ROOT="$HOME/.pyenv"                 # 3
export NVM_DIR="$HOME/.nvm"                      # 2
export PATH="$PYENV_ROOT/bin:$PATH"              # 1
export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"

# Prefer GNU coreutils and findutils commands with their real names
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"

# Add my bin to the path
[ -d  "$HOME/bin" ] && PATH="$PATH:$HOME/bin"

# if rbenv is present, configure it for use
if which rbenv >/dev/null 2>&1; then
    export PATH="$HOME/.rbenv/bin:$PATH"

    rbenv_init() {
        eval "$(rbenv init -)"
    }

    lazy_load rbenv_init rbenv bundle bundler gem irb rake ruby
fi


if which pyenv >/dev/null 2>&1; then
  pyenv_init() {
      eval "$(pyenv init -)"
  }

  lazy_load pyenv_init pyenv python pip
fi

if which pyenv-virtualenv-init >/dev/null 2>&1; then
  pyenv-virtualenv-init() {
    eval "$(command pyenv-virtualenv-init -)"
  }
fi

nvm_init() {
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
}

lazy_load nvm_init node npm

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.profile ]; then
  source ~/.profile
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8