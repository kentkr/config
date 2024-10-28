#!/bin/zsh

# symlink to neovim config
ln -s $PWD/nvim ~/.config/nvim

# vim-plug install
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/0.14.0/plug.vim'

# node install
curl -sL install-node.vercel.app/v22.10.0 | bash
