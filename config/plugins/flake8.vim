
"  =============== vim-flake8 =============== 
"  flake8 installation location
"let g:flake8_cmd="/usr/local/lib/python3.8/site-packages/flake8"
let g:flake8_quickfix_location="topleft"
" default: 1
let g:flake8_show_quickfix=1
let g:flake8_show_in_gutter=1
" default: 0
let g:flake8_show_in_file=1
" default: 500
let g:flake8_max_markers=500
" lint the file
" autocmd FileType python map <buffer> <leader>P :call flake8#Flake8()<CR>
" Show current line error, not used now.
"nnoremap <leader>P :call flake8#Flake8ShowError()<cr>
" lint when save python script
autocmd BufWritePost *.py call flake8#Flake8()

let g:flake8_error_marker='>>'     " set error marker to '>>'
let g:flake8_warning_marker='>'   " set warning marker to '>'
let g:flake8_pyflake_marker=''     " disable PyFlakes warnings
let g:flake8_complexity_marker='@'  " McCabe complexity warnings to '@'
let g:flake8_naming_marker=''      " disable naming warnings

" to use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
