
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

" Key Define
"nmap ga <Plug>(EasyAlign)
"xmap ga <Plug>(EasyAlign)
" Using predefined alignment rules
"   :EasyAlign[!] [N-th] DELIMITER_KEY [OPTIONS]
":EasyAlign :
":EasyAlign =
":EasyAlign *=
":EasyAlign 3\

" Using arbitrary regular expressions
"   :EasyAlign[!] [N-th] /REGEXP/ [OPTIONS]
":EasyAlign /[:;]\+/
":EasyAlign 2/[:;]\+/
":EasyAlign */[:;]\+/
":EasyAlign **/[:;]\+/

" Leaderf buffer
let g:which_key_map.b = { 'name': 'Buffers' }
" Leader command
" let g:which_key_map.c = {
"             \ 'name': 'Commands',
"             \ }
 
" YouCompleteMe show detail diagnostic
"let g:which_key_map.d = { 'name': 'YcmErrDetail' }
let g:which_key_map.d = { 'name': 'NERDTreeToggle' }
let g:which_key_map.D = { 'name': 'Documentation' }
let g:which_key_map.e = {
    \ 'name': '+ChangeMove',
    \ 'j':    'signify-next',
    \ 'k':    'signify-prec',
    \ }

let g:which_key_map.f = {
            \ 'name': 'Files',
            \ }

" let g:which_key_map.i = { 'name': 'REPLToggle' }

" And vim-go shorcut (just for go)
"let g:which_key_map.g = {
"            \ 'name': '+Gotos',
"            \ }

" Leaderf help
let g:which_key_map.h = { 'name': 'Helps' }

"let g:which_key_map.k = ['Maps', 'KeySettings']

" Leaderf line
let g:which_key_map.l = {'name': 'Lines'}
" leaderf rg -tbackend
let g:which_key_map.L = {'name': 'AllLines'}

" Leaderf commands
let g:which_key_map.p = { 'name': 'Commands' }
"let g:which_key_map.P = { 'name': 'Flake8_Check' }
" Leaderf mru
let g:which_key_map.r = {'name': 'RecentFiles'}
" PRUN()
let g:which_key_map.R = { 'name': 'Run' }
" :w<cr>
let g:which_key_map.s = {
    \ 'name': 'Save',
    \ }

" Think: set `T` for pytest.
" Leaderf bugTag
let g:which_key_map.t = {
    \ 'name': '+Tags|Symbols',
    \ }

" let g:which_key_map.T = { 'name' : 'Symbols' }

let g:which_key_map.w = {
      \ 'name' : '+Windows' ,
      \ 'o' : ['<C-w>w',              'other-window'],
      \ 'd' : ['<C-w>c',             'delete-window'],
      \ '-' : ['<C-w>s',        'split-window-below'],
      \ '|' : ['<C-w>v',        'split-window-right'],
      \ '2' : ['<C-w>v',     'layout-double-columns'],
      \ 'h' : ['<C-w>h',               'window-left'],
      \ 'j' : ['<C-w>j',              'window-below'],
      \ 'l' : ['<C-w>l',              'window-right'],
      \ 'k' : ['<C-w>k',                 'window-up'],
      \ 'H' : ['<C-w>10<',      'expand-window-left'],
      \ 'J' : ['resize +10',   'expand-window-below'],
      \ 'L' : ['<C-w>10>',     'expand-window-right'],
      \ 'K' : ['resize -10',      'expand-window-up'],
      \ '=' : ['<C-w>=',            'balance-window'],
      \ 's' : ['<C-w>s',        'split-window-below'],
      \ 'v' : ['<C-w>v',        'split-window-below'],
      \ 'w' : ['Windows',               'fzf-window'],
      \ }
