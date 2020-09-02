" Vim settings for Python, Go

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/default.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/plug.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/plugins.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/plugin-settings.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/colorscheme.vim'
" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/coc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/repl.vim'

" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/custom/default.vim'
" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/custom/plug.vim'
" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/custom/plugins.vim'
" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/custom/plugin-settings.vim'
" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/custom/colorscheme.vim'
" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/custom/coc.vim'
" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/custom/repl.vim'


" After all settings

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/which-key.vim'


" ================ often commands
" gf , c-w-f : 跳转文件
" c-o        : 跳转返回
