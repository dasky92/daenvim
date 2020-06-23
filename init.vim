" Vim settings for Python, GO

set encoding=utf-8

"let mapleader=" "
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" ================= Install Vim-Plug ====================
" Only install vim-plug when your first openning nvim/vim8
" When you have `nvim`, It think you use nvim instead of vim

let using_neovim = has('nvim')
if using_neovim
    let vim_config_root_path = '~/.config/nvim/'
else
    let vim_config_root_path = '~/.vim/'
endif

let plug_begin = expand(vim_config_root_path) . 'plugged'
let vim_plug_path = expand(vim_config_root_path) . 'autoload/plug.vim'

let vim_plug_need_install = 0

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
    let vim_plug_need_install = 1
endif

if vim_plug_need_install 
    :execute 'source '.fnamescape(vim_plug_path)
endif

" ==================== Plugins Setting Start  =====================
call plug#begin(plug_begin)

" color brackets
Plug 'frazrepo/vim-rainbow'
" Git support
Plug 'tpope/vim-fugitive'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'
" light status line different with powerline and airline
Plug 'itchyny/lightline.vim'
" Directory Manager
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
" tagbar for import, class, function, variables
Plug 'majutsushi/tagbar'
" colorscheme theme
Plug 'morhetz/gruvbox'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" fold
Plug 'tmhedberg/SimpylFold'
" Supply snippets, and for coc-snippets
Plug 'honza/vim-snippets'
" Coc.nvim for language completaion with lsp, It can load plugins
" 
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Load when you need
Plug 'liuchengxu/vim-which-key'
"Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
call plug#end()

if vim_plug_need_install
    echo "Install plugins..."
    :PlugInstall
endif

" Plugin Setting ========================================


" Require for all jedi Plugins: deoplete-jedi, vim-jedi, ncm2-jedi
"let g:python_host_prog = '/usr/bin/python'
"let g:python3_host_prog = '/usr/bin/python3'

"  =============== vim-rainbow =============== 
let g:rainbow_active=1

" lightline
set laststatus=2
" no use default --INSERT--
set noshowmode
" TODO: setting for pylint Warning,Error
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ],
      \   'right':[ ['fileformat', 'fileencoding' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status',
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
" don;t show these file types
let NERDTreeIngore = ['\.pyc$', '\.pyo$']
let NERDTreeShowLineNumbers = 1
" Enable folder icons

" Fix directory colors
"highlight! link NERDTreeFlags NERDTreeDir

let NERDTreeDirArrowExpandable = "►"
let NERDTreeDirArrowCollapsible = "▼"
"let NERDTreeNodeDelimiter = "." " middle dot

" Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

" Signify --------------------------

"this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = ['git', 'hg']
" mappings to jump to changed blocks
nmap <leader>sj <plug>(signify-next-hunk)
nmap <leader>sk <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Fzf ----------------------------
" file finder mapping
nnoremap <leader>ff :Files<CR>
nmap <leader>fg :GFiles<CR>
" tags (symbols) in current file finder mapping
nmap <leader>tl :BTag<CR>
" tags (symbols) in all files finder mapping
"nmap <leader>Tl :Tags<CR>
" general code finder in current file mapping
nmap <leader>ss :BLines<CR>
" general code finder in all files mapping
nmap <leader>sS :Lines<CR>
" commands finder mapping
" TODO: used often???
"nmap <leader>c :Commands<CR>
" vim help
nmap <leader>h :Helptags<CR>
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

" SimpylFold ---------------------------

" zc->fold, zo->open
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 1
let b:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 1
let b:SimpylFold_fold_import = 1

" vim-Surround ========================================
" "hello world" -> cs"' -> 'hello world'
" cs'<a> -> <a>hello world</a>
" cst" ->   "hello world"
" ds" ->    hello world
" ysiw] ->  [hello] world
" cs]{ ->   { hello } world
" yssb | yss) -> ({hello} world)
" ds{ds) ->  hello world
" ysiw<em> -> <em>hello</em> world

" ================== ColorScheme ====================

if has('gui_running') || using_neovim || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
    colorscheme gruvbox
else
    colorscheme delek
endif

" ==================== Plugins Setting End ====================

" ================== Custom configurations ====================
nnoremap <silent> <leader>fc :vsp $MYVIMRC<CR>
" It has no any plugins.
" You can use it as vimrc directly.
"execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/custom-default.vim'
" {{{ custom-default.vim

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
" IMPORTANT PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" hide toolbar and menu
set guioptions-=T
set guioptions-=m
" not show startup suomali
set shortmess=atI
set shortmess+=c
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
inoremap <c-c> <ESC>

" move to beginning/end of line
" 0 == ^
"nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap zz :q!<CR>
nnoremap <leader>fs :w!<CR>

" ===== Shortcut =====
" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
"map tm :tabm
map tt :tabnew
map tc :tabclose<CR>
map ts :tab split<CR>

" ===== Buffer =====
" these keymap could slow `b` motion
"map bn :bn<CR>
"map bp :bp<CR>
"map bl :ls<CR>
"map bd :bd<CR>


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
set nowritebackup
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
  " highlight key word
  au Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
  "au Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  au BufNewFile,BufRead *.md syntax keyword todo TODO FIX
  " get correct comment highlight for json file
  au FileType json syntax match Comment +\/\/.\+$+
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

" change file mode between ReadWrite and ReadOnly
function! ChangeReadOnly()
    if(&readonly == 1)
        set noreadonly
    else
        set readonly
    endif
endfunc
nnoremap <leader>fr :call ChangeReadOnly()<cr>

" Ctrl-j,Ctrl-k to select the popup menu:
"inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<c-j>"
"inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<c-k>"

" }}}
"execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/custom-coc.vim'
" {{{ custom-coc.vim

let g:coc_global_extensions = [
    \ 'coc-bookmark',
    \ 'coc-snippets',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-markdownlint',
    \ 'coc-highlight',
    \ 'coc-template',
    \ 'coc-yank',
    \ 'coc-cmake',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-emmet',
    \ 'coc-python',
    \ 'coc-clangd',
    \ 'coc-go',
    \ 'coc-omnisharp',
    \ ]
" if hidden not set, TextEdit might fail
set hidden
set cmdheight=2
set updatetime=300
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Select first default
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `g` and `g` to navigate diagnostics/errors
nmap <silent> <leader>gk <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gj <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>caa  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>fx  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>
" Open yank list (-A)auto preview on (--normal)normal mode
nnoremap <silent> <leader>cy  :<C-u>CocList -A --normal yank<cr>
nnoremap <silent> <leader>cn  :<C-u>CocList snippets<CR>
" Clear all yanks
":CocCommand yank.clean

function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')

" }}}
" which_key_map
set timeoutlen=500
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
" load when needed
autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
"call which_key#register('<Space>', 'g:which_key_map')
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
"nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

"execute 'source' fnamemodify(expand('<sfile>'), ':h').'/custom/custom-which-key.vim'
" {{{ custom-which-key.vim

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

"let g:which_key_map.c = {
"            \ 'name': '+CocList/commands',
"            \ 'c': 'Commands',
"            \ 'd': 'diagnostic',
"            \ 'e': 'extensions',
"            \ 'j': 'CocNext',
"            \ 'k': 'CocPrev',
"            \ 'p': 'CocListResume',
"            \ 's': 'Symbols',
"            \ 'o': 'Outline',
"            \ 'y': 'YankList',
"            \ 'n': 'snippets',
"            \ }
let g:which_key_map['c'] = {
            \ 'name': '+commands',
            \ 'e': 'extensions',
            \ }
"let g:which_key_map.c.e = 'extensions'

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

" }}}

