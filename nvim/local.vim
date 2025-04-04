" any databricks file from your ~/.databrickscfg file
let g:databricks_profile = 'dev'
" the databricks cluster id you want to execute commands on
let g:databricks_cluster_id = '1030-160029-m2ucf1ad'

" vim-databricks
" normal mode get all text
nnoremap <leader>sp :call databricks#main(databricks#get_buffer_text())<CR>
" visual mode get selection - visual lines, does not work with block text
vnoremap <leader>sp :<C-u>call databricks#main(databricks#get_visual_selection())<CR>

" vimspector specific configs
let g:vimspector_base_dir='/Users/kyle.kent/.local/share/nvim/plugged/vimspector'
let g:python3_host_prog = '/opt/homebrew/bin/python3.11'
