# Path to your oh-my-zsh installation.
export ZSH=/Users/lekov/.oh-my-zsh

ZSH_THEME="vokela"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git git-extras brew autojump virtualenvwrapper virtualenv-prompt python pyenv atom bower history-substring-search)

if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
fi

source $ZSH/oh-my-zsh.sh

# Config history
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

if [ -f "$HOME/.zsh_aliases" ]; then
    source "$HOME/.zsh_aliases"
fi

if [ -f "$HOME/.zsh/bindkeys.zsh" ]; then
    source "$HOME/.zsh/bindkeys.zsh"
fi

if [ -f "$HOME/.zsh/functions.zsh" ]; then
    source "$HOME/.zsh/functions.zsh"
fi

alias zshreload=". ~/.zshrc"
