if [ -f /usr/local/share/antigen/antigen.zsh ]; then
  source /usr/local/share/antigen/antigen.zsh
fi

if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
fi

AGENT_SOCK=$(gpgconf --list-dirs | grep agent-socket | cut -d : -f 2)

if [[ ! -S $AGENT_SOCK ]]; then
  gpg-agent --daemon --use-standard-socket &>/dev/null
fi

export GPG_TTY=$TTY

antigen use oh-my-zsh

antigen bundle heroku
antigen bundle command-not-found

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle tarruda/zsh-autosuggestions

antigen bundle L3K0V/zsh-files
antigen theme L3K0V/zsh-files themes/vokela

antigen apply

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
HISTFILE=~/.zsh_history          # where to store zsh config
HISTSIZE=1024                    # big history
SAVEHIST=1024                    # big history
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
