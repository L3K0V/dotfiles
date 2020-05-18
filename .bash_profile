function lazy_load() {
    if [ $# -lt 2 ]; then
        echo "Usage: lazy_load <initialization_function> <cmd> [ <cmd2> [..] ]"
        return
    fi

    local init_func=$1
    shift
    local cmd_list=( "$@" )

    for cmd in "${cmd_list[@]}"; do        
        eval "function $cmd() {
            echo \"Lazy loading $cmd...\"
            unset -f ${cmd_list[@]}
            $init_func
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

    lazy_load rbenv_init rbenv bundle bundler gem irb rake rails ruby pod
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

lazy_load nvm_init nvm node npm gulp ng yo ui5 gulp yarn

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