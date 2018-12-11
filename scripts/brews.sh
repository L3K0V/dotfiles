#!/bin/sh

# Install homebrew if it isn't already installed
if ! hash brew 2> /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Use latest package definitions
brew update

# Upgrade old packages (if any)
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# GPG Signing
brew install gpg
brew install gpg-agent
brew install pinentry-mac
brew install certbot

# Install Bash 4 and zsh
brew install bash
brew install zsh
brew install antigen

# Install environments
brew install pyenv
brew install pyenv-virtualenv
brew install rbenv
brew install postgresql
brew install opencv3 --with-python3

# Install essential homebrews
brew install vim --with-override-system-vi
brew install redis
brew install tree
brew install wget
brew install parallel
brew install webp
brew install git
brew install highlight
brew install detox

# Install essential casks
brew cask install java
brew cask install homebrew/cask-versions/java8 # Needed for Android SDK

# Internet
brew cask install google-chrome
brew cask install skype
brew cask install slack
brew cask install transmission
brew cask install webtorrent

# IDEs
brew cask install android-studio
brew cask install atom
# brew cask install textmate

# Development
brew cask install android-sdk
brew cask install android-ndk
brew cask install github
brew cask install paw
brew cask install sourcetree
brew cask install sketch
brew cask install zeplin
brew cask install fastlane
brew install heroku/brew/heroku

# Databases
brew cask install postico
brew cask install postgres

# Virtualization
brew cask install docker
brew cask install kitematic
brew cask install parallels-desktop

# Media
brew cask install spotify
brew cask install vlc

# Utilities
brew cask install appcleaner
brew cask install flux
brew cask install the-unarchiver
brew cask install iterm2
brew cask install reflector
brew cask install keybase
brew cask install sip
brew cask install etcher # ISO Burner
brew cask install alfred
brew cask install numi
brew cask install agenda
brew cask install coconutbattery
brew cask install dash

# Remove outdated versions from the Cellar
brew cleanup
