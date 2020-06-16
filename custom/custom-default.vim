" NO Plugins used here
"
" ===== Colors =====
" no vi-compatible
set nocompatible
" syntax highlight on
syntax on
filetype plugin indent on
set noswapfile
" auto change work directory
set autochdir


" ===== Leader key =====
" leader is comma
let mapleader=" "
" quick into command mode
nnoremap ; :

" ===== UI Config =====
" show command in bottom bar
set number
set relativenumber
" show command in botton bar
set showcmd
" highlight current line
set cursorline
" hightlight column maxsize flag
set colorcolumn=80,100,120
" softbreak
set linebreak
" visual autocomplete for command menu
set wildmenu
" redraw only when we need to.
set lazyredraw
set history=100

" ===== Fold =====
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
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

" ===== Edit =====
" binary not eight num
set nrformats-=octal
set autoindent
" let backspace can delete
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" save undo history even though close vim
set undofile
" cursor in last left when you in the file.
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal`\"" | endif


" ===== Spaces & Tabs =====
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ruler
" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

" ===== Movement =====
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
nnoremap <leader>w :w!<CR>

" ===== Shortcut =====
" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
"map tm :tabm
map tt :tabnew
map tc :tabclose<CR>
map ts :tab split<CR>

" ===== Buffer =====
map bn :bn<CR>
map bp :bp<CR>
map bl :ls<CR>
map bd :bd<CR>


" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j

imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" save as sudo
ca w!! w !sudo tee "%"

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
" set fileencodings=ucs-bom,utf-8,chinese,cp936

set nobackup
set autoread
" share with windows system clipboard
set clipboard+=unnamed
" paste not busy
set nopaste
set ignorecase smartcase

" ============== AutoGroups ===============
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    " clear empty spaces at the end of lines on save of python files
    autocmd BufWritePre *.py :%s/\s\+$//e
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

augroup md
  autocmd!
  au BufNewFile,BufRead *.md syntax keyword todo TODO FIX
  au BufNewFile,BufRead *.md inoremap <buffer> ;` ```<cr><cr>```<Up><Up>
augroup END


set pastetoggle=<F10>

" remove ugly vertical lines on window division
set fillchars+=vert:\

" run python by F5
map <F5> :call PRUN()<CR>
func! PRUN()
    exec "w"
    if &filetype == 'python'
        exec "!python3 %"
    endif
endfunc

" the following already existed in init.vim file, but this file as vimrc file
" must have its.
" nnoremap <leader>vv :vsp $MYVIMRC<CR>
" not used frequently, recommend close. You can open when you setting you vim
" frequently.
"nnoremap <leader>so :source $MYVIMRC<CR>
