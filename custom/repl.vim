" vim-repl.vim
" {{{
let g:repl_program = {
            \   'python': ['ipython'],
            \   'default': ['zsh'],
            \   'r': ['R'],
            \   'lua': ['lua'],
            \   'vim': ['vim -e'],
            \   }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
" send code to repl
let g:sendtorepl_invoke_key = "<leader>p"
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
nnoremap <leader>i :REPLToggle<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3
" }}}
