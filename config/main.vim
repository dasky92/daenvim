" Better default settings.
" =================================================================================================
" =================================================================================================
" =================================================================================================

" Colors
" =================================================================================================
" no vi-compatible
set nocompatible
" syntax highlight on
syntax on
filetype plugin indent on
" auto change work directory
set autochdir
" no bell
set novisualbell

" Leader Key
" =================================================================================================
" leader is comma
let mapleader=" "
 
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
" Require for all jedi Plugins: deoplete-jedi, vim-jedi, ncm2-jedi
"let g:python_host_prog = '/usr/bin/python'
"let g:python3_host_prog = '/usr/bin/python3'
" quick into command mode
nnoremap ; :

" UI
" =================================================================================================
" show command in bottom bar
set number
" Be convinent for vim command
set relativenumber
" show command in botton bar
set showcmd
" set showtabline=1
" highlight current line
set cursorline
" highlight current column
" set cursorcolumn
" hightlight column maxsize flag
set colorcolumn=100
" set code warning column
highlight ColorColumn ctermbg=6
" softbreak
set linebreak
" visual autocomplete for command menu
set wildmenu
" redraw only when we need to.
set lazyredraw
set history=100

" Fold
" =================================================================================================
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

au BufRead *.vim set foldmethod=marker
" method: manual/indent/expr/syntax/diff/marker
set foldlevel=99

" highlight matching [{()}]
set showmatch
" search as characters are entered
set incsearch
" highlight matches
set hlsearch
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest,full

" hide toolbar and menu
set guioptions-=T
set guioptions-=m
" not show startup suomali
set shortmess=atI
" not ring
set noerrorbells
set novisualbell

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*,*\.DS_Store
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" thin/long/wide/tree
let g:netrw_liststyle=3
" hide banner
let g:netrw_banner=0
" explore width/editor percent
let g:netrw_winsize=25

" =================================================================================================
" binary not eight num
set nrformats-=octal
set autoindent
" let backspace can delete
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" cursor in last left when you open the file.
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal`\"" | endif

" save undo history even though close vim
set noundofile
set noswapfile
set nobackup
set undodir=~/.undodir

" Space & Tab
" =================================================================================================
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ruler
" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Move
" =================================================================================================
" move vertically by visual line, realline <=> visualine
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" jk is escape, <ESC> is very far away. jk is a much better.
inoremap jk <ESC>

" move to beginning/end of line
" 0 == ^
"nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap zz :q!<CR>
nnoremap <leader>s :w!<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" =================================================================================================
" :tabn     :tabnext    -> tab next
" :tabp     :tabprev    -> tab previous
" :tabnew               -> tab new
" :tabonly              -> tab only open
" :tabclose             -> tab close
" :tabs                 -> tab list
" :tab(number)          -> tab number
" gt                    -> tab next
" gT                    -> tab previous

" ===== Buffer =====
" :ls   :buffers    -> buffer list
" :bn               -> buffer next
" :bp               -> buffer previous
" :b(num)           -> buffer number
" :ba   :badd       -> buffer add file
" :bdelete          -> buffer delete


" navigate windows with "leader + window + direction"
" map <leader>wl <c-w>l
" map <leader>wh <c-w>h
" map <leader>wk <c-w>k
" map <leader>wj <c-w>j
" " ???????
" map <leader>w- <c-w>-
" map <leader>w+ <c-w>+
" map <leader>w= <c-w>=

" save as sudo
ca w!! w !sudo tee "%"

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
" set fileencodings=ucs-bom,utf-8,chinese,cp936

set autoread
" share with windows system clipboard
set clipboard+=unnamed
" paste not busy
set nopaste
set ignorecase smartcase

" autogroup
" =================================================================================================
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    " clear empty spaces at the end of lines on save of python files
    autocmd BufWritePre *.py :%s/\s\+$//e
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

augroup md
  autocmd!
  au BufNewFile,BufRead *.md syntax keyword TODO FIXIT NOTE
  au BufNewFile,BufRead *.md inoremap <buffer> ;` ```<cr><cr>```<Up><Up>
  au BufNewFile,BufRead *.gohtml set filetype=gohtmltmpl
augroup END


set pastetoggle=<F10>

" remove ugly vertical lines on window division
set fillchars+=vert:\

" run python by F5
nnoremap <leader>R :call PRUN()<CR>

func! PRUN()
    exec "w"
    if &filetype == 'python'
        exec "!python3 %"
    elseif &filetype == 'go'
        exec "GoRun"
    endif
endfunc


" =================================================================================================
" =================================================================================================
" =================================================================================================
" Load Other Vim Scripts

let g:init = ''
let g:start = (g:init) . '/start'
let g:plugins = (g:init) . '/plugins'
let g:after = (g:init) . '/after'
let g:plug_control =  '/autoload'

" ===> new configuration, need to test
function! Dot(path)
    return "~/.vim" . a:path
endfunction

function! Load(path)
  for file in split(glob(Dot(a:path . '*.vim')), '\n')
    execute 'source' file
  endfor
endfunction

" Load other settings
" call Load(g:plug_control)
" " call Load(g:plugins_installed)
" call Load(g:init)
" call Load(g:start)
" call Load(g:plugins)
" call Load(g:after)



execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/start/plug.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/abbrev.vim'


" plugins/
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/colorscheme.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/easymotion.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/flake8.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/fzf.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/leaderF.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/lightline.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/markdown.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/nerdtree.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/pytest.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/rainbow.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/signify.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/surrouond.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/vimgo.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/youcompleteme.vim'

" Not used temporary.
"execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/tagbar.vim'
"execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/simplefold.vim'
"execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/plugins/indentline.vim'

" after al plugins
execute 'source' fnamemodify(expand('<sfile>'), ':h').(g:init).'/after/which-key.vim'




