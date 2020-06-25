
" which_key_map
set timeoutlen=500
" leader key locate after plugins.
"let g:mapleader = "\<Space>"
"let g:maplocalleader = ','
" load when needed
"autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
call which_key#register('<Space>', 'g:which_key_map')
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
"nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" Vim-WhichKey ===========================================
" hide a group of non-top level mappings
" let g:which_key_map['_'] = { 'name': 'which_key_ignore' }

let g:which_key_map = {}

let g:which_key_map['?'] = { 'name': 'init.vim/vimrc' }

" fzf-buffers
nnoremap <leader>b :Buffers<CR>
let g:which_key_map.b = { 'name': 'Buffers' }

let g:which_key_map.c = {
            \ 'name': '+CocList/commands',
            \ 'c': 'coc-commands',
            \ 'd': 'coc-diagnostic',
            \ 'e': 'coc-extensions',
            \ 'n': 'coc-next',
            \ 'o': 'coc-outline',
            \ 'p': 'coc-prev',
            \ 's': 'coc-snippets',
            \ 'r': 'cocListResume',
            \ 't': 'coc-symbols',
            \ 'y': 'coc-yankList',
            \ }

let g:which_key_map.d = { 'name': 'Document' }
let g:which_key_map.f = {
            \ 'name': '+Files/format',
            \ 'f': "git-files",
            \ 'g': "git-file-lines",
            \ 'm': 'format-selection',
            \ 'r': 'readonly-mode',
            \ 'x': 'fix-current-line',
            \ }

let g:which_key_map.g = {
            \ 'name': '+Gotos',
            \ 'd': 'definition',
            \ 'j': 'diagnostic-next',
            \ 'k': 'diagnostic-prev',
            \ 'y': 'type-definition',
            \ 'i': 'implementation',
            \ 'r': 'reference',
            \ }

let g:which_key_map.h = { 'name': '+Helps' }

let g:which_key_map.k = { 'name': 'key-map' }

" conque-shell
let g:which_key_map.p = { 'name': 'SendToREPL' }

let g:which_key_map.r = { 'name': 'Rename' }

" TODO: fzf search git files
let g:which_key_map.s = {
            \ 'name': '+Search',
            \ 's': 'search-current-file',
            \ 'S': 'search-all-open-files',
            \ 'j': 'signify-next',
            \ 'k': 'signify-prec',
            \ }

let g:which_key_map.t = {
            \ 'name': '+Tags',
            \ 't': 'buffer-tags',
            \ 'T': 'all-files-tags',
            \ }


let g:which_key_map.w = {
      \ 'name' : '+Windows/write' ,
      \ 'o' : ['<C-w>w'     , 'other-window']          ,
      \ 'd' : ['<C-w>c'     , 'delete-window']         ,
      \ '-' : ['<C-w>s'     , 'split-window-below']    ,
      \ '|' : ['<C-w>v'     , 'split-window-right']    ,
      \ '2' : ['<C-w>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-w>h'     , 'window-left']           ,
      \ 'j' : ['<C-w>j'     , 'window-below']          ,
      \ 'l' : ['<C-w>l'     , 'window-right']          ,
      \ 'k' : ['<C-w>k'     , 'window-up']             ,
      \ 'H' : ['<C-w>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-w>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-w>='     , 'balance-window']        ,
      \ 's' : ['<C-w>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-w>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }
