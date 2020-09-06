
" which_key_map
set timeoutlen=500
" leader key locate after plugins.
" load when needed
"autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
call which_key#register('<Space>', 'g:which_key_map')
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
"nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" Vim-WhichKey ===========================================
" name don't contain special char
" hide a group of non-top level mappings
" let g:which_key_map['_'] = { 'name': 'which_key_ignore' }

let g:which_key_map = {}

let g:which_key_map['?'] = [':vsp $MYVIMRC', 'vimrc']
" gcc provided by vim-surround
" shortcut for comment a line
let g:which_key_map['/'] = ['gcc']

" ???
let g:which_key_map.a = {
            \ 'name': 'align',
            \ 'a':    ['<Plug>(EasyAlign)', 'eash-align'],
            \ }

" fzf-buffers
let g:which_key_map.b = { 'name': 'Buffers' }

" let g:which_key_map.c = {
"             \ 'name': 'NUll',
"             \ }

" YouCompleteMe show detail diagnostic
let g:which_key_map.d = { 'name': 'YcmErrDetail' }
let g:which_key_map.D = { 'name': 'NERDTreeToggle' }
let g:which_key_map.e = {
    \ 'name': '+ErrorMove',
    \ 'j':    'signify-next',
    \ 'k':    'signify-prec',
    \ }

let g:which_key_map.f = {
            \ 'name': '+Files/format',
            \ 'f':    "LeaderF",
            \ 'a':    "Gtags--append",
            \ 'b':    "Buffer-Current",
            \ 'B':    'Buffer-All',
            \ 'd':    'Gtags-d',
            \ 'o':    'Gtags--recall',
            \ 'n':    'Gtags--next',
            \ 'p':    'Gtags--previous',
            \ 'r':    'Gtags-r',
            \ 'R':    'Rg--recall',
            \ 's':    'Rg--C++',
            \ }

" let g:which_key_map.i = { 'name': 'REPLToggle' }

" Reference to YouCompleteMe for common c,cpp,py,go,(java,js,ts,etc)
" And vim-go shorcut (just for go)
let g:which_key_map.g = {
            \ 'name': '+Gotos',
            \ 'd':    'definition',
            \ 'h':    'declaration',
            \ 'l':    'diagnostic',
            \ 't':    'goto any',
            \ 'r':    'reference',
            \ }

"let g:which_key_map.h = { 'name': '+helps' }

"let g:which_key_map.k = ['Maps', 'KeySettings']

let g:which_key_map.l = {'name': 'Flake8Lint'}
" Show current line falke8 error msg
let g:which_key_map.L = {'name': 'ShowPyLintErr'}

let g:which_key_map.m = {'name': 'MRU'}

let g:which_key_map.p = { 'name': 'MarkdownPreview' }
let g:which_key_map.P = { 'name': 'MarkdownStop' }

let g:which_key_map.r = { 'name': 'Run' }

let g:which_key_map.s = {
    \ 'name': 'Save',
    \ }

" leave for py.test???
let g:which_key_map.t = {
    \ 'name': '+Tags|Symbols',
    \ }

" let g:which_key_map.T = { 'name' : 'Symbols' }

let g:which_key_map.w = {
      \ 'name' : '+Windows' ,
      \ 'o' : ['<C-w>w'     , 'other-window']          ,
      \ 'd' : ['<C-w>c'     , 'delete-window']         ,
      \ '-' : ['<C-w>s'     , 'split-window-below']    ,
      \ '|' : ['<C-w>v'     , 'split-window-right']    ,
      \ '2' : ['<C-w>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-w>h'     , 'window-left']           ,
      \ 'j' : ['<C-w>j'     , 'window-below']          ,
      \ 'l' : ['<C-w>l'     , 'window-right']          ,
      \ 'k' : ['<C-w>k'     , 'window-up']             ,
      \ 'H' : ['<C-w>10<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +10'  , 'expand-window-below']   ,
      \ 'L' : ['<C-w>10>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -10'  , 'expand-window-up']      ,
      \ '=' : ['<C-w>='     , 'balance-window']        ,
      \ 's' : ['<C-w>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-w>v'     , 'split-window-below']    ,
      \ 'w' : ['Windows'    , 'fzf-window']            ,
      \ }
