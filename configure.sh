#!/bin/zsh

# install base software
source ./install.sh
# symlink to zshrc
ln -s $PWD/.zshrc ~/.zshrc
# general software install
source ./configure_gen.sh
# neovim setup
source ./configure_nvim.sh
