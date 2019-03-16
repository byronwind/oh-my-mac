#!/usr/bin/env bash

# Install homebrew and command-line tools

sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Xcode command line tools
xcode-select --install


# check Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
  source ~/.bash_profile
fi 

# brew update
brew update

# brew upgrade
brew upgrade

# install GNU coreutils
brew install coreutils
brew install moreutils
brew install findutils
brew install binutils
brew install gnu-sed
brew install ack
brew install tree
brew install wget

# bash completion

brew install bash-completion
echo "[[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && . /usr/local/etc/profile.d/bash_completion.sh" >> ~/.bash_profile
source ~/.bash_profile


# python
brew install python@2
brew install python3

# vim
brew install vim
brew install git

# git
git config --global user.name "liguoqing"
git config --global user.email "byronwind@gmail.com"

# ssh
echo "config ssh..."
ssh-keygen -t rsa -C "byronwind@gmail.com" -f ~/.ssh/id_rsa_github
if ! [ -f ~/.ssh/config ]; then
  touch ~/.ssh/config
fi 
echo "Host github.com \n\t HostName github.com \n\t IdentityFile ~/.ssh/id_rsa_github" > ~/.ssh/config


# zsh and oh-my-zsh
echo "Installing zsh and oh-my-zsh..."
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# cleanup
brew cleanup 
