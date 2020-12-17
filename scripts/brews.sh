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
brew install pinentry-mac
brew install certbot

# Install Bash 4 and zsh
brew install bash-completion@2
brew install zsh
brew install getantibody/tap/antibody

brew install mas

# Install environments
brew install pyenv
brew install pyenv-virtualenv
brew install rbenv
brew install nvm

brew install heroku/brew/heroku

# Install essential homebrews
brew install vim
brew install tree
brew install wget
brew install parallel
brew install git
brew install ack
brew install highlight
brew install detox
brew install diff-so-fancy
brew install tldr
brew install scrcpy

brew install speedtest-cli
brew install trash
brew install wifi-password

brew install cocoapods
brew install swiftlint
brew install ktlint

# Homebrew Cask
# http://caskroom.io
#
# Read https://github.com/Homebrew/homebrew-cask/issues/58046 if you ever see:
# Error: Cask 'wireshark' definition is invalid: invalid 'depends_on macos' value: ">= :mountain_lion"

# Install essential casks
brew install --cask adoptopenjdk

brew tap AdoptOpenJDK/openjdk
brew install --cask adoptopenjdk/openjdk/adoptopenjdk8 # Needed for Android SDK
brew install --cask adoptopenjdk/openjdk/adoptopenjdk11 # Optional for backend development

# Internet
brew install --cask google-chrome
brew install --cask brave-browser
brew install --cask slack
brew install --cask 1password

# IDEs
brew install --cask android-studio
brew install --cask visual-studio-code
brew install --cask intellij-idea
brew install --cask clion # For Embedded development

# Development
brew install --cask android-sdk
brew install --cask android-ndk
brew install --cask github
brew install --cask sourcetree
brew install --cask sketch

# Nordic
brew install --cask homebrew/cask-drivers/nordic-nrf-command-line-tools
brew install --cask homebrew/cask-drivers/nordic-nrf-connect
brew install --cask segger-jlink
brew tap ArmMbed/homebrew-formulae
brew install arm-none-eabi-gcc
brew install dfu-util

# Virtualization
brew install --cask docker
brew install --cask parallels-desktop
brew install --cask kitematic

# Media
brew install --cask spotify
brew install --cask iina

brew install --cask microsoft-office
brew install --cask microsoft-teams

# Utilities
brew install --cask setapp
brew install --cask the-unarchiver
brew install --cask iterm2
brew install --cask reflector
brew install --cask keybase
brew install --cask alfred
brew install --cask agenda
brew install --cask coconutbattery
brew install --cask kap
brew install --cask rectangle
brew install --cask ledger-live

# Font Casks
# https://github.com/caskroom/homebrew-fonts

brew tap homebrew/cask-fonts

brew install --cask font-open-sans
brew install --cask font-roboto
brew install --cask font-hack-nerd-font
brew install --cask font-sauce-code-pro-nerd-font

# Remove outdated versions from the Cellar
brew cleanup
