" Vim settings

set encoding=utf-8

" ================= Install Vim-Plug ====================
" Only your first open nvim/vim8

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

" ============== Plugin List ===============

Plug 'ncm2/ncm2-vim'
" color brackets
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-fugitive'
" light status line
Plug 'itchyny/lightline.vim'

" For python3 only
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Automatically sort python imports
Plug 'fisadev/vim-isort', { 'for': 'python' }

Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'majutsushi/tagbar'
" colorscheme monokai like sublime
Plug 'patstockwell/vim-monokai-tasty'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
" colortheme
Plug 'Townk/vim-autoclose'

" Surround
Plug 'tpope/vim-surround'

" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'

" Nice icons in the file explorer and file type status line.
Plug 'ryanoasis/vim-devicons'

Plug 't9md/vim-choosewin'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

Plug 'mattn/emmet-vim'
" high speed html and css

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" commenter for most language
Plug 'scrooloose/nerdcommenter'

" fold
Plug 'tmhedberg/SimpylFold'

" ncm2 for completation
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
" python async autocompletation
Plug 'ncm2/ncm2-jedi', { 'for': 'python' }
"Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-pyclang'
" Require ultisnips plugin
Plug 'ncm2/ncm2-ultisnips'
" Subscope detection
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-rst-subscope'

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

" Require for all jedi Plugins: deoplete-jedi, vim-jedi, ncm2-jedi
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" ncm2 settings
" suppress thre annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" CTRL-C don't trigger the InsertLeave autocmd
inoremap <c-c> <ESC>
" Ctrl-j,Ctrl-k to select the popup menu:
inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<c-j>"
inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<c-k>"


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
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right':[ ['lineinfo'],
      \             ['percent'],
      \             ['fileformat', 'fileencoding' ] ]
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



" SimpylFold ---------------------------

" zc->fold, zo->open
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 1
let b:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 1
let b:SimpylFold_fold_import = 1


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

" ncm2-ultisnips =============
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')


" ================== ColorScheme ====================

if has('gui_running') || using_neovim || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
    colorscheme vim-monokai-tasty
else
    colorscheme delek
endif


" ================== Custom configurations ====================

" It has no any plugins.
" It can use it as vimrc directly.
let custom_common = '~/.config/nvim/custom/custom-default.vim'
if filereadable(expand(custom_common))
	execute 'source' expand(custom_common)
endif


" Detailed python-mode settings for pythonist
" It is so import that I move it to single vim file.
let custom_pymode = '~/.config/nvim/custom/custom-pymode.vim'
if filereadable(expand(custom_pymode))
    execute 'source' expand(custom_pymode)
endif


" must place after all settings
" because plugins's setting will affect the following keymap
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>vv :vsp $MYVIMRC<CR>
nnoremap <leader>so :source $MYVIMRC<CR>
