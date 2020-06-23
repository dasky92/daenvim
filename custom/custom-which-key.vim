
" Vim-WhichKey ===========================================
" hide a group of non-top level mappings
" let g:which_key_map['_'] = { 'name': 'which_key_ignore' }

let g:which_key_map = {}

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'b' : ['Buffers'   , 'fzf-buffer']      ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'j' : ['bnext'     , 'next-buffer']     ,
      \ 'k' : ['bprevious' , 'previous-buffer'] ,
      \ }

let g:which_key_map.c = {
            \ 'name': '+CocList/commands',
            \ 'c': 'Commands',
            \ 'd': 'diagnostic',
            \ 'e': 'extensions',
            \ 'j': 'CocNext',
            \ 'k': 'CocPrev',
            \ 'p': 'CocListResume',
            \ 's': 'Symbols',
            \ 'o': 'Outline',
            \ 'y': 'YankList',
            \ 'n': 'snippets',
            \ }

let g:which_key_map.f = {
            \ 'name': '+files/format',
            \ 'c': 'OpenVimrcFile',
            \ 'f': "Files",
            \ 'g': "GitFiles",
            \ 'm': 'Format Selection',
            \ 'r': 'ReadOnlyMode',
            \ 's': 'Save',
            \ 'x': 'FixCurrentLine',
            \ }

let g:which_key_map.g = {
            \ 'name': '+Gotos',
            \ 'd': 'Difinition',
            \ 'j': 'diagnostic-next',
            \ 'k': 'diagnostic-prev',
            \ 'y': 'TypeDifinition',
            \ 'i': 'Implementation',
            \ 'r': 'Reference',
            \ }

let g:which_key_map.h = { 'name': 'Helps' }

let g:which_key_map.k = { 'name': 'ShowDocument' }

let g:which_key_map.r = {
            \ 'name': '+rename',
            \ 'n': 'rename',
            \ }

let g:which_key_map.s = {
            \ 'name': 'Search',
            \ 'f': 'CurrentFileSearch',
            \ 's': 'CurrentDirFiles',
            \ 'j': 'signify next',
            \ 'k': 'signify prec',
            \ }

let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-w>w'     , 'other-window']          ,
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
