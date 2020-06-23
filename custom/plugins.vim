
" {{{
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

" }}}
