#!/bin/bash
# Simple setup.sh for configuring Ubuntu instance
# for headless setup. 

sudo apt-get install -y git
sudo apt-get install -y curl

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint


# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-get install emacs


# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi

ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .
