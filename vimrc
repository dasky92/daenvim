" Vim settings for Python, Go

let g:init = '/init'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/default.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plug.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugin-settings.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/colorscheme.vim'
" execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/coc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/repl.vim'

" After all settings

execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/which-key.vim'


" ================ often commands
" gf , c-w-f : 跳转文件
" c-o        : 跳转返回
" ctrl + d   : 内置terminal返回vim
" ]]         : next function
" [[         : prev function
