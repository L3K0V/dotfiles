
function zssh() {
  ssh "$@" -t zsh
}

function hgrep () {
    history | egrep --color=auto --recursive "$@" | egrep --color=auto --recursive -v "hgrep $@"
}

function keyhash() {
  keytool -exportcert -alias $2 -keystore $1 | openssl sha1 -binary | openssl base64
}
