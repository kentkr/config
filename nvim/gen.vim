
" when starting a terminal buffer start insert
autocmd TermOpen * startinsert

" when entering a term buffer start insert
autocmd BufWinEnter,WinEnter term://* startinsert

" when leaving a terminal buffer get out of insert
autocmd BufLeave term://* stopinsert

" " key mappings for the terminal buffer
" this assigns the <Esc> key to leave insert mode
tnoremap <Esc> <C-\><C-n>

" set line numbers on files by default
set nu 

" no line numbers in terminal buffer
autocmd TermOpen * setlocal nonumber norelativenumber

" set color scheme to spaceduck
if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
endif

colorscheme spaceduck

" activate lualine 
lua << END
require('lualine').setup {
  options = {
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    },
    inactive_sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'filetype'}
    }
}
END

" split buffers right and bottom
set splitbelow                                     
set splitright

" Copy to clipboard -- does not work on accre at the moment
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" set clipboard to sys
set clipboard+=unnamedplus

" global indentation settings
set tabstop=4
auto FileType htmldjango setl tabstop=2

set shiftwidth=4
auto FileType htmldjango setl shiftwidth=2

set expandtab

" no text wrapping
set nowrap

" keymap enter and shift enter to add new lines below and above
" shift enter doesn't seem to work
nmap <CR> o<Esc>
nmap <S-Enter> O<Esc> 

" vimcmdline mappings
 let cmdline_map_start          = '<LocalLeader>pf'
 let cmdline_map_send           = '<LocalLeader>d'
 let cmdline_map_send_and_stay  = '<LocalLeader>l'
 let cmdline_map_source_fun     = '<LocalLeader>f'
 let cmdline_map_send_paragraph = '<LocalLeader>p'
 let cmdline_map_send_block     = '<LocalLeader>b'
 let cmdline_map_send_motion    = '<LocalLeader>m'
 let cmdline_map_quit           = '<LocalLeader>pq'

" but vimcmdline input needs to be changed
if has('gui_running') || &termguicolors
    let cmdline_color_input    = '#ecf0c1'
    let cmdline_color_normal   = '#ecf0c1'
    let cmdline_color_number   = '#f2ce00'
    let cmdline_color_integer  = '#f2ce00'
    let cmdline_color_float    = '#f2ce00'
    let cmdline_color_complex  = '#f2ce00'
    let cmdline_color_negnum   = '#f2ce00'
    let cmdline_color_negfloat = '#f2ce00'
    let cmdline_color_date     = '#00a3cc'
    let cmdline_color_true     = '#f2ce00'
    let cmdline_color_false    = '#f2ce00'
    let cmdline_color_inf      = '#f2ce00'
    let cmdline_color_constant = '#5fafff'
    let cmdline_color_string   = '#00a3cc'
    let cmdline_color_stderr   = '#e33400'
    let cmdline_color_error    = '#e33400'
    let cmdline_color_warn     = '#e33400'
    let cmdline_color_index    = '#d7d787'
endif

" tree-sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  --ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  indent = {enable = false},
  yati = {
    enable = true,
    -- Disable by languages, see `Supported languages`
    disable = { "python" },

    -- Whether to enable lazy mode (recommend to enable this if bad indent happens frequently)
    default_lazy = true,

    -- Determine the fallback method used when we cannot calculate indent by tree-sitter
    --   "auto": fallback to vim auto indent
    --   "asis": use current indent as-is
    --   "cindent": see `:h cindent()`
    -- Or a custom function return the final indent result.
    default_fallback = "auto"
  },
}
EOF

"code folding for treesitter 
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
"autocmd BufReadPost,FileReadPost * normal zR

"https://www.linuxfordevices.com/tutorials/linux/setup-coc-autocompletion-vim
"Coc pyright settings

let g:coc_global_extensions = ['coc-pyright']
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" some shit for rgp color highlighting -- coc-highlighting
autocmd CursorHold * silent call CocActionAsync('highlight')

" turn off mouse clicking
set mouse=

" dadbod leader execute query
map <leader>db <Plug>DB

" function for operator mapping
func! DBExe(...)
    if !a:0
        let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
        return 'g@'
    endif
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    if a:1 == 'char' " Invoked from Visual mode, use gv command.
        silent exe 'normal! gvy'
    elseif a:1 == 'line'
        silent exe "normal! '[V']y"
    else
        silent exe 'normal! `[v`]y'
    endif
    
    execute "DB " . @@
    
    let &selection = sel_save
    let @@ = reg_save
endfunc

" actual mappings
xnoremap <expr> <Plug>(DBExe)     DBExe()
nnoremap <expr> <Plug>(DBExe)     DBExe()
nnoremap <expr> <Plug>(DBExeLine) DBExe() . '_'

xmap <leader>db  <Plug>(DBExe)
nmap <leader>db  <Plug>(DBExe)
omap <leader>db  <Plug>(DBExe)
nmap <leader>dbb <Plug>(DBExeLine)

" create function to select dadbod db -- this bit doesn't work in neovim
command! DBSelect :call popup_menu(map(copy(g:dadbods), {k,v -> v.name}), {
    \"callback": 'DBSelected'
    \})

func! DBSelected(id, result)
    if a:result != -1
        let b:db = g:dadbods[a:result-1].url
        echomsg 'DB ' . g:dadbods[a:result-1].name . ' is selected.'
    endif
endfunc

" dadbod defining dbs
let g:db = 'postgresql://kylekent@localhost/dev_db'
"
let g:dadbods = []
let db = {
\"name": "bt_599",
\"url": "postgresql://kylekent@localhost/dev_db"
\}

call add(g:dadbods, db)

" set default db
let g:db = g:dadbods[0].url

" vimspector c++ adapter
function! OpenVimspector(dir)
    let comm = '/Users/kylekent/open_vimspector.sh ' . a:dir
    call system(comm)
endfunction

let g:vimspector_install_gadgets = ['CodeLLDB', 'debugpy']
nnoremap <Leader>dl :call vimspector#Launch()<CR>
"nnoremap <Leader>dl :call OpenVimspector(getcwd())<CR>
nnoremap <Leader>dr :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dB :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dR <Plug>VimspectorRestart
nmap <Leader>do <Plug>VimspectorStepOut
nmap <Leader>ds <Plug>VimspectorStepInto
nmap <Leader>d<Space> <Plug>VimspectorStepOver

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" cf copies file name
nnoremap <leader>cf :execute 'let @+ = expand("%:t:r")'<CR>

" open py definition in preview
nmap <silent> <leader>p :call CocAction('jumpDefinition', 'pedit')<CR>

" save a session then quit all
nnoremap <leader>qs :mksession! ./.session.vim<CR>:qa<CR>

" indent-blankline.nvim
lua << EOF
require('ibl').setup({
    scope = {
        enabled = true,
    },
})
EOF
