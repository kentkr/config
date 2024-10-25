#!/bin/zsh

# add zshrc
cp zsh/zshrc ~/.zshrc
# general software install
source ./configure_gen.sh
# neovim setup
source ./configure_nvim.sh
