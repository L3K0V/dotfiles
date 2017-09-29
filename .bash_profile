# Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

export PATH="/usr/sbin:/sbin:$PATH"              # 6
export PATH="/usr/bin:/bin:$PATH"                # 5
export PATH="$HOME/.fastlane/bin:$PATH"          # 4
export PATH="$HOME/opt/local/bin:$PATH"          # 3
export PATH="/usr/local/bin:$PATH"               # 2
export PATH="/usr/local/opt/gpg-agent/bin:$PATH" # 1

# Prefer GNU coreutils commands with their real names
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Add my bin to the path
[ -d  "$HOME/bin" ] && PATH="$PATH:$HOME/bin"

# if rbenv is present, configure it for use
if which rbenv &> /dev/null; then
    # Put the rbenv entry at the front of the line
    export PATH="$HOME/.rbenv/bin:$PATH"

    # enable shims and auto-completion
    eval "$(rbenv init -)"
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.profile ]; then
  source ~/.profile
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
