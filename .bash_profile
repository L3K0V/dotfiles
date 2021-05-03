# Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"

export PATH="/usr/local/sbin:$PATH"
export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"

# Prefer GNU coreutils and findutils commands with their real names
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"

# Add my bin to the path
[ -d  "$HOME/bin" ] && PATH="$PATH:$HOME/bin"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

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