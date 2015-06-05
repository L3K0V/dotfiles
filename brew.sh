#!/bin/sh

# Install homebrew if it isn't already installed
if ! hash brew 2> /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Use latest package definitions
brew update

# Upgrade old packages (if any)
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install essential homebrews
brew install hub # https://hub.github.com/
brew install fish --HEAD # http://fishshell.com/
brew install macvim --with-lua --custom-icons --override-system-vim --HEAD #
brew install python
brew install python3
brew install ruby
brew install tree
brew install wget
brew install git
brew install android-sdk
brew install android-ndk
brew install pidcat

# Install essential casks
brew install caskroom/cask/brew-cask

# Internet
brew cask install google-chrome
brew cask install hazel
brew cask install skype
brew cask install battle-net
brew cask install steam
brew cask install utorrent
brew cask install tunnelblick

# Development
brew cask install android-studio
brew cask install intellij-idea-ce
brew cask install sourcetree
brew cask install gitbook
brew cask install github
brew cask install eclipse-java
brew cask install atom
brew cask install textmate

# Media
brew cask install vlc
brew cask install vox
brew cask install vox-preferences-pane

# Utiliries
brew cask install flux
brew cask install ccleaner
brew cask install the-unarchiver
brew cask install dash
brew cask install iterm2
brew cask install android-file-transfer

brew cleanup
