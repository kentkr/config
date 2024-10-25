#!/bin/zsh

# add zshrc
cp zsh/zshrc ~/.zshrc
# general software install
source ./configure_gen.sh
# download fonts
brew install font-hack-nerd-font
# neovim setup
source ./configure_nvim.sh
