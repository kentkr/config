#!/bin/zsh

# install base software
source ./install.sh
# symlink to zshrc
ln -s $PWD/zsh/.zshrc ~/.zshrc
# create secrets file
touch ~/.secrets
# general software install
source ./configure_gen.sh
# neovim setup
source ./configure_nvim.sh
