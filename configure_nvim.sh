#!/bin/zsh

# neovim setup
cp -r ./nvim ~/.config/

# vim-plug install
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# node install
curl -sL install-node.vercel.app/lts | bash
