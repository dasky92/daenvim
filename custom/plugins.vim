" Plugin List
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
" `.` repeat extend
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" fold
Plug 'tmhedberg/SimpylFold'
" Give snippets, and for coc-snippets
Plug 'honza/vim-snippets'
" Coc.nvim for language completaion with lsp, It can load plugins
" ================== Language Related =================
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" together coc-go with vim-go will work on well
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
" language code repl
Plug 'sillybun/vim-repl' 

" Load when you need
Plug 'liuchengxu/vim-which-key'
"Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
call plug#end()

if vim_plug_need_install
    echo "Install plugins..."
    :PlugInstall
endif

" }}}
