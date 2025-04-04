

" vim-databricks
" normal mode get all text
nnoremap <leader>sp :call databricks#main(databricks#get_buffer_text())<CR>
" visual mode get selection - visual lines, does not work with block text
vnoremap <leader>sp :<C-u>call databricks#main(databricks#get_visual_selection())<CR>

" any databricks file from your ~/.databrickscfg file
let g:databricks_profile = 'dev'
" the databricks cluster id you want to execute commands on
let g:databricks_cluster_id = '0420-160411-p8oi50n1'
