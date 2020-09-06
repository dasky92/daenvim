
let g:init = '/init'

execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/simple.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/start/plug.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/plugin-settings.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/colorscheme.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/abbrev.vim'

execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/markdown.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/pytest.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/vimgo.vim'

execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/leaderF.vim'
"execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/coc.vim'
"execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/repl.vim'

execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/final/which-key.vim'




" ===> new configuration, need to test
function! Dot(path)
    return "~/.vim" . a:path
endfunction

function! Load(path)
  for file in split(glob(Dot(a:path . '*.vim')), '\n')
    echo file
    execute 'source' file
  endfor
endfunction


let g:start = (g:init) . '/start'
let g:plugins = (g:init) . '/plugins'
let g:final = (g:init) . '/final'
let g:plug_control = (g:init) . '/autoload'
let g:plugins_installed = (g:init) . '/plugged'

"call Load(g:plug_control)
"call Load(g:plugins_installed)
"call Load(g:start)
"call Load(g:init)
"call Load(g:plugins)
"call Load(g:final)

