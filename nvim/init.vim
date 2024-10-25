source ~/.config/nvim/gen.vim
if filereadable(expand('~/.config/nvim/local.vim'))
    source ~/.config/nvim/local.vim
endif
