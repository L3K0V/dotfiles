# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
fi

AGENT_SOCK=$(gpgconf --list-dirs | grep agent-socket | cut -d : -f 2)

if [[ ! -S $AGENT_SOCK ]]; then
  gpg-agent --daemon --use-standard-socket &>/dev/null
fi

export GPG_TTY=$TTY

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Workaround for insecure completions on multiuser setup
export ZSH_DISABLE_COMPFIX=true

export ANTIBODY_HOME=~/Libary/antibody
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-oh-my-zsh"
fpath+=($ZSH/plugins/docker)

source ~/.zsh_plugins.sh

##
# Completion
##
setopt hash_list_all            # hash everything before completion
setopt completealiases          # complete alisases
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word         # allow completion from within a word/phrase
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' insert-tab pending

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
setopt NO_CASE_GLOB
setopt AUTO_CD


# Exclude commands from the command history
zshaddhistory() {
    local line=${1%%$'\n'}
    local cmd=${line%% *}
    # Only those that satisfy all of the following conditions are added to the history
    [[ ${#line} -ge 5
       && ${cmd} != ll
       && ${cmd} != ls
       && ${cmd} != la
       && ${cmd} != cd
       && ${cmd} != man
       && ${cmd} != scp
       && ${cmd} != vim
       && ${cmd} != nvim
       && ${cmd} != less
       && ${cmd} != ping
       && ${cmd} != open
       && ${cmd} != file
       && ${cmd} != which
       && ${cmd} != whois
       && ${cmd} != drill
       && ${cmd} != uname
       && ${cmd} != md5sum
       && ${cmd} != pacman
       && ${cmd} != xdg-open
       && ${cmd} != traceroute
       && ${cmd} != speedtest-cli
       && ${cmd} != brew
    ]]
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

. $(brew --prefix asdf)/asdf.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

 autoload -U compinit && compinit