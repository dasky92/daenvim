" {{{ >>> Plugins <<<

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
" Directory Manager
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
" tagbar for import, class, function, variables
Plug 'majutsushi/tagbar'
" colorscheme theme
Plug 'doums/darcula'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
" work better for python file.
Plug 'jiangmiao/auto-pairs'
Plug 'hynek/vim-python-pep8-indent'
" better move
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Supply Mechanism for self-defined snippets 
Plug 'sirver/ultisnips'
" Predefined snippets
Plug 'honza/vim-snippets'
" Load when you need
Plug 'liuchengxu/vim-which-key'
" no prebuild, need for nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Insert toc for markdown
Plug 'mzlogin/vim-markdown-toc'
" =============== Python ==============
Plug 'nvie/vim-flake8'
" py.test for python
Plug 'alfredodeza/pytest.vim'
" =============== Go ==============
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
call plug#end()
if vim_plug_need_install
    echo "Install plugins..."
    :PlugInstall
endif

" }}}
