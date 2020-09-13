" Plugin List
" {{{
call plug#begin(plug_begin)

" start ui
Plug 'mhinz/vim-startify'
" color brackets
Plug 'frazrepo/vim-rainbow'
" Git support
Plug 'tpope/vim-fugitive'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'
" light status line different with powerline and airline
Plug 'itchyny/lightline.vim'
" show indent lines
" not use, because it will slow and show inaccurately.
" Plug 'valloric/vim-indent-guides'
" Plug 'yggdroot/indentline'
" Directory Manager
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
" tagbar for import, class, function, variables
Plug 'majutsushi/tagbar'
" colorscheme theme
Plug 'morhetz/gruvbox'
Plug 'doums/darcula'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
" better move
Plug 'easymotion/vim-easymotion'
" `.` repeat extend
" Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
" Code and files fuzzy finder
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Supply Mechanism for self-defined snippets 
Plug 'sirver/ultisnips'
" Predefined snippets
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
" language code repl
" Plug 'sillybun/vim-repl' 
" Load when you need
Plug 'liuchengxu/vim-which-key'

" no prebuild, need for nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mzlogin/vim-markdown-toc'
" py.test for python
Plug 'alfredodeza/pytest.vim'

" =============== language ==============
Plug 'nvie/vim-flake8'
call plug#end()

if vim_plug_need_install
    echo "Install plugins..."
    :PlugInstall
endif

" }}}
