
call plug#begin()
    source $HOME/.config/nvim/gen_plugins.vim
    if filereadable(expand('$HOME/.config/nvim/local_plugins.vim'))
        source $HOME/.config/nvim/local_plugins.vim
    endif
call plug#end()

source $HOME/.config/nvim/gen.vim
if filereadable(expand('$HOME/.config/nvim/local_plugins.vim'))
    source $HOME/.config/nvim/local.vim
endif
