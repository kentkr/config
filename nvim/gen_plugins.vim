" Sourced by init.vim to install vim-plug plugins

" adding nerd tree
Plug 'preservim/nerdtree', {'tag': '7.1.3'}

" adding the spaceduck theme
Plug 'kentkr/spaceduck', { 'branch': 'main' }

" plug for just adding git branch name
Plug 'itchyny/vim-gitbranch'

" fun status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons', {'tag': 'v0.100'}

" auto pairs of brackets etc
Plug 'jiangmiao/auto-pairs', {'tag': 'v1.3.4'}

"Coc
Plug 'neoclide/coc.nvim', {'commit': '57d488a06bdb34de89acef3c2f3e9ce609d632ed'} "{'branch': 'release', }

" tree sitter for highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'tag': 'v0.9.2'}

" better indenting for js/ts
Plug 'yioneko/nvim-yati', { 'tag': '0.0.5' }

" vim dadbod
Plug 'tpope/vim-dadbod', {'tag': 'v1.4'}

" better py indenting
Plug 'Vimjas/vim-python-pep8-indent'

" c++ debugger
Plug 'puremourning/vimspector', {'tag': '4240501875'}

Plug 'lukas-reineke/indent-blankline.nvim', {'tag': 'v3.9.0'}

" ansii escape colors in files
Plug 'powerman/vim-plugin-AnsiEsc', {'tag': '13.3'}

" markdown renderer
Plug 'MeanderingProgrammer/render-markdown.nvim', {'tag': 'v8.6.0'}
