if [ -f /usr/local/share/antigen/antigen.zsh ]; then
  source /usr/local/share/antigen/antigen.zsh
fi

antigen use oh-my-zsh

antigen bundle heroku
antigen bundle command-not-found

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle tarruda/zsh-autosuggestions

antigen bundle L3K0V/zsh-files
antigen theme L3K0V/zsh-files themes/vokela

antigen apply

if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
fi

rbenv() {
    eval "$( command rbenv init - )"
    rbenv "$@"
}

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

if [ -f "$HOME/.zsh_aliases" ]; then
    source "$HOME/.zsh_aliases"
fi

if [ -f "$HOME/.zsh/bindkeys.zsh" ]; then
    source "$HOME/.zsh/bindkeys.zsh"
fi

if [ -f "$HOME/.zsh/functions.zsh" ]; then
    source "$HOME/.zsh/functions.zsh"
fi

alias zshreload="antigen reset && exec /usr/local/bin/zsh -i"

##
# Completion
##
setopt hash_list_all            # hash everything before completion
setopt completealiases          # complete alisases
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word         # allow completion from within a word/phrase
setopt correct                  # spelling correction for commands
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.

##
# History
##
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=1024                   # big history
SAVEHIST=1024                   # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword
