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
brew install getantibody/tap/antibody

brew install mas

# Install environments
brew install pyenv
brew install pyenv-virtualenv
brew install rbenv
brew install nvm

mkdir ~/.nvm

brew install heroku/brew/heroku

# Install essential homebrews
brew install vim
brew install redis
brew install tree
brew install wget
brew install parallel
brew install webp
brew install git
brew install highlight
brew install detox
brew install swiftlint
brew install diff-so-fancy
brew install tldr
brew install scrcpy

brew install speedtest-cli
brew install archey
brew install trash
brew install wifi-password

# Homebrew Cask
# http://caskroom.io
#
# Read https://github.com/Homebrew/homebrew-cask/issues/58046 if you ever see:
# Error: Cask 'wireshark' definition is invalid: invalid 'depends_on macos' value: ">= :mountain_lion"

# Install essential casks
brew cask install java
brew cask install homebrew/cask-versions/java8 # Needed for Android SDK
brew cask install homebrew/cask-versions/java11 # Optional for backend development

# Internet
brew cask install google-chrome
brew cask install brave-browser
brew cask install skype
brew cask install slack
brew cask install transmission
brew cask install 1password

# IDEs
brew cask install android-studio
brew cask install visual-studio-code
brew cask install clion # For Embedded development

# Development
brew cask install android-sdk
brew cask install android-ndk
brew cask install github
brew cask install sourcetree
brew cask install sketch
brew cask install zeplin
brew cask install fastlane

# Nordic
brew cask install homebrew/cask-drivers/nordic-nrf-command-line-tools
brew cask install homebrew/cask-drivers/nordic-nrf-connect
brew cask install segger-jlink
brew tap ArmMbed/homebrew-formulae
brew install arm-none-eabi-gcc
brew install dfu-util

# Virtualization
brew cask install docker
brew cask install parallels-desktop

# Media
brew cask install spotify
brew cask install iina

# Utilities
brew cask install setapp
brew cask install flux
brew cask install the-unarchiver
brew cask install iterm2
brew cask install reflector
brew cask install keybase
brew cask install alfred
brew cask install agenda
brew cask install coconutbattery
brew cask install kap

# Font Casks
# https://github.com/caskroom/homebrew-fonts

tap 'homebrew/cask-fonts'

cask 'font-open-sans'
cask 'font-roboto'
cask 'font-source-code-pro'

# Remove outdated versions from the Cellar
brew cleanup
