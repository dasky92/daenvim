" Vim settings for Python, GO

set encoding=utf-8

" which_key_map already set leader, so comment here
"let mapleader=" "

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/default.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/plug.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/plugins.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/plugin-settings.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/colorscheme.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/coc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/which-key.vim'
