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

# Install Bash 4
brew install bash

# Install essential homebrews
brew install vim --override-system-vi
brew install macvim --with-lua --custom-icons --override-system-vim --HEAD #
brew install python
brew install python3
brew install ruby
brew install redis
brew install tree
brew install wget
brew install parallel
brew install webp
brew install git
brew install android-sdk
brew install android-ndk
brew install zsh
brew install zsh-completions
brew install highlight
brew install htop-osx
brew install detox
brew install rbenv
brew install ruby-build

# Install essential casks
brew install caskroom/cask/brew-cask

# Internet
brew cask install google-chrome
brew cask install skype
brew cask install transmission

# Development
brew cask install android-studio
brew cask install intellij-idea
brew cask install gitbook-editor
brew cask install github-desktop
brew cask install atom
brew cask install textmate
brew cask install paw
brew cask install virtualbox
brew cask install sourcetree
brew cask install sketch
brew cask install fastlane

# Media
brew cask install vlc
brew cask install vox
brew cask install vox-preferences-pane

# utilities
brew cask install flux
brew cask install the-unarchiver
brew cask install iterm2
brew cask install reflector

# Remove outdated versions from the Cellar
brew cleanup

# Link .app files into /Applications
brew linkapps
