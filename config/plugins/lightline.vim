
" lightline
set laststatus=2
" no use default --INSERT--
set noshowmode
" TODO: setting for pylint Warning,Error
" COLORSCHEME:
" default: powerline,
" wombat, jelllybeans, solarized dark, solarized light, one light, landscape
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right':[ ['fileformat', 'fileencoding' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ 'component':{
      \ },
      \ }
