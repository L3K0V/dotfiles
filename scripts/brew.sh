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

brew install gpg

# Install Bash 4 and zsh
brew install bash
brew install zsh
brew install antigen

# Install environments
brew install pyenv
brew install pyenv-virtualenv
brew install rbenv
brew install ruby-build

# Install essential homebrews
brew install vim --override-system-vi
brew install macvim --with-lua --custom-icons --override-system-vim --HEAD #
brew install redis
brew install tree
brew install wget
brew install parallel
brew install webp
brew install git
brew install highlight
brew install htop-osx
brew install detox

# Install essential casks
brew tap caskroom/cask

brew cask install java

# Internet
brew cask install google-chrome
brew cask install skype
brew cask install slack
brew cask install discord
brew cask install telegram-desktop
brew cask install transmission

# IDEs
brew cask install android-studio
brew cask install intellij-idea-ce
brew cask install atom
brew cask install textmate

# Development
brew cask install android-sdk
brew cask install android-ndk
brew cask install gitbook-editor
brew cask install github-desktop
brew cask install paw
brew cask install sourcetree
brew cask install sketch
brew cask install fastlane

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
brew cask install vox
brew cask install vox-preferences-pane

# Utilities
brew cask install flux
brew cask install the-unarchiver
brew cask install iterm2
brew cask install reflector
brew cask install macs-fan-control
brew cask install cleanmymac
brew cask install coconutbattery
brew cask install spectacle
brew cask install etcher
brew cask install force-paste
brew cask install skitch
brew cask install sqlitebrowser
brew cask install keybase

# Remove outdated versions from the Cellar
brew cleanup

# Link .app files into /Applications
brew linkapps

echo "Go to https://www.bresink.com/osx/0TinkerTool/download.php to download TinkerTool"
