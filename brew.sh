#!/bin/sh

# Install homebrew if it isn't already installed
if ! hash brew 2> /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Use latest package definitions
brew update

# Upgrade old packages (if any)
brew upgrade --all

# Install essential homebrews
brew install hub # https://hub.github.com/
brew install fish --HEAD # http://fishshell.com/
brew install macvim --with-lua --custom-icons --override-system-vim --HEAD # 
