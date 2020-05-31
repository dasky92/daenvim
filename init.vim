" Vim settings

set encoding=utf-8
let using_neovim = has('nvim')
let using_vim = !using_neovim

let vim_plug_just_installed = 0
if using_neovim
    let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
else
    let vim_plug_path = expand('~/.vim/autoload/plug.vim')
endif

if !filereadable(vim_plug_path)
    echo "Installing Vim-Plug"
    echo ""
    if using_neovim
	silent !mkdir -p ~/.config/nvim/autoload
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
	silent !mkdir -p ~/.vim/autoload
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    let vim_plug_just_installed = 1
endif

if vim_plug_just_installed
    :execute 'source '.fnamescape(vim_plug_path)
endif

if using_neovim
    call plug#begin("~/.config/nvim/plugged")
else
    call plug#begin("~/.vim/plugged")
endif

" ============== Plugins ===============
" color brackets
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-fugitive'
" light status line
Plug 'itchyny/lightline.vim'
" Python autocomplete
"Plug 'deoplete-plugins/deoplete-jedi'

" For python3 only
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Automatically close parenthesis, etc
Plug 'davidhalter/jedi-vim'
"Plug 'tell-k/vim-autopep8'
" Automatically sort python imports
Plug 'fisadev/vim-isort'

Plug 'jmcantrell/vim-virtualenv'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'majutsushi/tagbar'
" colorscheme monokai like sublime
Plug 'patstockwell/vim-monokai-tasty'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
" colortheme
Plug 'Townk/vim-autoclose'

" Surround
Plug 'tpope/vim-surround'

"Plug 'mileszs/ack.vim'
" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'

" Nice icons in the file explorer and file type status line.
Plug 'ryanoasis/vim-devicons'

Plug 't9md/vim-choosewin'

"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

Plug 'mattn/emmet-vim'
" high speed html and css

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" commenter for most language
Plug 'scrooloose/nerdcommenter'

" fold
Plug 'tmhedberg/SimpylFold'

" Track the engine
Plug 'SirVer/ultisnips'
" Snippets are seperated from the engine
Plug 'honza/vim-snippets'

call plug#end()

" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Install plugins..."
    :PlugInstall
endif

" Plugin Setting ========================================

" vim-rainbow
let g:rainbow_active=1

" lightline
set laststatus=2
" no use default --INSERT--
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right':[ ['lineinfo'],
      \             ['percent'],
      \             ['fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component':{
      \ },
      \ }

" Tagbar ------------------
"toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus=1

" NERDTree ----------------

" toggle nerdtree display
map <F2> :NERDTreeToggle<CR>
" open nerdtree with current file selected
nmap <leader>t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIngore = ['\.pyc$', '\.pyo$']
" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Fix directory colors
highlight! link NERDTreeFlags NERDTreeDir

" Remove expandable arrow
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes ="v:true"
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"

" Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

" Ack.vim --------------------------

" mappings
"nmap <leader>r :Ack
"nmap <leader>wr :execute ":Ack " . expand('<cword>')<CR>

" Signify --------------------------

"this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = ['git', 'hg']
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Autoclose -------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave
" insert mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Fzf ----------------------------
" file finder mapping
nmap <C-p> :Files<CR>
" buffer finder mapping
nmap <C-e> :Buffers<CR>
" tags (symbols) in current file finder mapping
nmap <leader>g :BTag<CR>
" the same, but with the word under the cursor pre filled
nmap <leader>wg :execute ":BTag " . expand('<cword>')<CR>
" tags (symbols) in all files finder mapping
nmap <leader>G :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap <leader>wG :execute ":Tags " . expand('<cword>')<CR>
" general code finder in current file mapping
nmap <leader>f :BLines<CR>
" the same, but with the word under the cursor pre filled
nmap <leader>wf :execute ":BLines " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap <leader>F :Lines<CR>
" the same, but with the word under the cursor pre filled
nmap <leader>wF :execute ":Lines " . expand('<cword>')<CR>
" commands finder mapping
nmap <leader>c :Commands<CR>
" :GFiles [OPTS]       Git files (git ls-files)
" :GFiles?             git status
" :Colors              colorschemes
" :(B)Lines [QUERY]    Lines in loaded buffers
" :(B)Tags [QUERY]     Tags in the project (ctags -R)
" :Marks
" :Windows
" :Snippets            (UltiSnips)
" :(B)Commits          Git commits(require fugitive.vim)
" :Commands
" :Maps                Normal mode mappings
" :Helptags
" :Filetypes


" Deoplete -----------------------------

" Use deoplete.
"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option({
"            \   'ignore_case': v:true,
"            \   'smart_case': v:true,
"            \})
" complete with words from any opened file
"let g:context_filetype#same_filetypes = {}
"let g:context_filetype#same_filetypes._ = '_'

" SimpylFold ---------------------------

" zc->fold, zo->open
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 1
let b:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 1
let b:SimpylFold_fold_import = 1

" Python-Mode ==========================
" :help pymode
" virtualenv support
" Run <leader>r
" Add breakpoints <leader>b
" Autofix PEP8 errors: PymodeLintAuto
" Go to Definition: <C-c>g
" Search in python documentation: <leader>K
" python motions and operators: ]], 3]], ]]M, vaC, viM, daC, ciM

" Jedi-vim ------------------------------

" python autocompletion
let g:jedi#completions_enabled = 1
let g:jedi#completions_command = "<C-Space>"

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',g'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,d :tab split<CR>:call jedi#goto()<CR>>>

" isort ===============================================

let g:vim_isort_map='<C-i>'

" vim-virtualenv =====================================

" Usage:
" :VirtualEnvList
" :VirtualEnvActivate venv
" :VirtualEnvDeactivate

" Snippets ============================================

let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnippets']
if using_neovim
    let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'
else
    let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
endif

" This will be not compatiable with YCM
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" into choosed filetype's snippets to edit
"map <leader>us :UltiSnipsEdit<CR>


" Common Setting ========================================

if has('gui_running') || using_neovim || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
    colorscheme vim-monokai-tasty
else
    colorscheme delek
endif
" remove ugly vertical lines on window division
set fillchars+=vert:\


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
nnoremap <leader>q :q<CR>
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
map <leader>bn :bn<CR>
map <leader>bp :bp<CR>
map <leader>bl :ls<CR>
map <leader>bd :bd<CR>


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

" run python by F5
map <F5> :call PRUN()<CR>
func! PRUN()
    exec "w"
    if &filetype == 'python'
        exec "!python %"
    endif
endfunc
" ============== Finally ===============

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>vv :vsp $MYVIMRC<CR>
nnoremap <leader>so :source $MYVIMRC<CR>
set pastetoggle=<F10>

" Custom configurations ----------------

" Include user's custom nvim configurations
if using_neovim
    let custom_configs_path = "~/.config/nvim/custom.vim"
else
    let custom_configs_path = "~/.vim/custom.vim"
endif

if filereadable(expand(custom_configs_path))
    execute "source " . custom_configs_path
endif

