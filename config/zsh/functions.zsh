
function zssh() {
  ssh "$@" -t zsh
}

function hgrep () { 
    history | egrep --color=auto --recursive "$@" | egrep --color=auto --recursive -v "hgrep $@"
}
