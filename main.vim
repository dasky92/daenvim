" Use foldmethod=marker manage vimrc file.
"
" {{{ NO Plugins

"" {{{ >>> Fold Documentation <<<
" za : open/close fold
" zc : close fold
" zo : open fold
" zr : open all fold
" zR : open all fold and nested fold
" zm : close all fold
" zM : close all fold and nested fold
" zj : move to next fold
" zk : move to prev fold
" zn : on fold
" zN : off fold
" }}}

" {{{ >>> Colors <<<
" no vi-compatible
set nocompatible
" syntax highlight on
syntax on
filetype plugin indent on
" auto change work directory
set autochdir
" no bell
set novisualbell
" }}}

" {{{ >>> Leader Key <<<
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
" Require for all jedi Plugins: jedi, maccabe, flake8, pylint
let g:python_host_prog = '/usr/bin/python'
" ~/.pyenv/versions/3.8.5/envs/hello/bin/
let g:python3_host_prog = '/usr/bin/python3'
" quick into command mode
nnoremap ; :
" }}}

" {{{ >>> UI Display <<<
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
" }}}

" {{{ >>> Fold <<<
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
set foldlevel=99
au BufRead *.vim set foldmethod=marker
au BufRead vimrc set foldmethod=marker
au BufRead *.py set foldmethod=indent
" method: manual/indent/expr/syntax/diff/marker
" }}}

" {{{ >>> Better Defaults <<<

" save as sudo
ca w!! w !sudo tee "%"
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
" set fileencodings=ucs-bom,utf-8,chinese,cp936
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

set autoread
" share with windows system clipboard
set clipboard+=unnamed
set ignorecase smartcase
" binary not eight num
set nrformats-=octal
set autoindent
set smartindent
set indentexpr=
" let backspace can delete
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" remove ugly vertical lines on window division
set fillchars+=vert:\
" cursor in last left when you open the file.
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal`\"" | endif

" save undo history even though close vim
set noundofile
set noswapfile
set nobackup
set undodir=~/.undodir
" }}}

" {{{ >>> Movement <<<
" move vertically by visual line, realline <=> visualine
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" jj is escape, <ESC> is very far away. jk is a much better.
inoremap jj <ESC>

" move to beginning/end of line
" 0 == ^
"nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap zz :q!<CR>
" OFF, because it will trigger `REPLACE MODEL`
"nnoremap <leader>s :w!<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
" }}}

" {{{ >>> Tab Docmentation <<<
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
" }}}

" {{{ Windows Manager
map <leader>wo <C-w>w
map <leader>wd <C-w>c
map <leader>w- <C-w>s
map <leader>w\| <C-w>v
" hjkl
map <leader>wj <C-w>j
map <leader>wk <C-w>k
map <leader>wh <C-w>h
map <leader>wl <C-w>l

map <leader>w= <C-w>=
" }}}

" {{{ >>> Space & Tab <<<
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ruler
" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
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
" }}}

" {{{ >>> Markdown <<<
augroup md
  autocmd!
  au BufNewFile,BufRead *.md syntax keyword TODO FIXIT NOTE
  au BufNewFile,BufRead *.md inoremap <buffer> ;` ```<cr><cr>```<Up><Up>
  au BufNewFile,BufRead *.gohtml set filetype=gohtmltmpl
augroup END
" }}}

" {{{ >>> paste, run <<<
" paste not busy
set nopaste
set pastetoggle=<F10>
func! PRUN()
    exec "w"
    if &filetype == 'python'
        exec "!python3 %"
    elseif &filetype == 'go'
        exec "GoRun"
    endif
endfunc
" run python by F5
nnoremap <leader>r :call PRUN()<CR>
" }}}



" }}}

" {{{ plug download if not


let vim_config_root_path = '~/.vim/'
let plug_begin = expand(vim_config_root_path) . 'plugged'
let vim_plug_path = expand(vim_config_root_path) . 'autoload/plug.vim'

let vim_plug_need_install = 0

if !filereadable(vim_plug_path)
    echo "Installing Vim-Plug"
    echo ""
	silent !mkdir -p ~/.vim/autoload
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_need_install = 1
endif

if vim_plug_need_install
    :execute 'source '.fnamescape(vim_plug_path)
endif

" }}}

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
" manage ctags in the future, now in leaderF gtags
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'skywind3000/gutentags_plus'
"colorscheme theme
Plug 'doums/darcula'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
" 前后空格显示告警色
Plug 'bronson/vim-trailing-whitespace'
" work better for python file.
Plug 'jiangmiao/auto-pairs'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
" better move
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" 异步执行插件
Plug 'skywind3000/asyncrun.vim'
" Supply Mechanism for self-defined snippets
Plug 'sirver/ultisnips'
" Predefined snippets
Plug 'honza/vim-snippets'
" Load when you need
Plug 'liuchengxu/vim-which-key'
" no prebuild, need for nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Insert toc for markdown
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
" =============== Python ==============
Plug 'nvie/vim-flake8', { 'for': 'python' }
" py.test for python
Plug 'alfredodeza/pytest.vim', { 'for': 'python' }
" =============== Go ==============
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
call plug#end()
if vim_plug_need_install
    echo "Install plugins..."
    :PlugInstall
endif

" }}}

" {{{ Plugin Settings

" {{{ ColorScheme
if has('gui_running') || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
    colorscheme onedark
    " colorscheme hemisu
else
    colorscheme hemisu
endif
" }}}

" {{{ EasyMotion

" Trigger for easymotion.
map , <Plug>(easymotion-prefix)
" <prefix>-w    :   move to word
" <prefix>-f{char}  :   move to {char}

" }}}

" {{{ Flake8

"  flake8 installation location
"let g:flake8_cmd="/usr/local/lib/python3.8/site-packages/flake8"
let g:flake8_quickfix_location="topleft"
" default: 1
let g:flake8_show_quickfix=1
let g:flake8_show_in_gutter=1
" default: 0
let g:flake8_show_in_file=1
" default: 500
let g:flake8_max_markers=500
" lint the file
" autocmd FileType python map <buffer> <leader>P :call flake8#Flake8()<CR>
" Show current line error, not used now.
"nnoremap <leader>P :call flake8#Flake8ShowError()<cr>
" lint when save python script
autocmd BufWritePost *.py call flake8#Flake8()

let g:flake8_error_marker='>>'     " set error marker to '>>'
let g:flake8_warning_marker='>'   " set warning marker to '>'
let g:flake8_pyflake_marker=''     " disable PyFlakes warnings
let g:flake8_complexity_marker='@'  " McCabe complexity warnings to '@'
let g:flake8_naming_marker=''      " disable naming warnings

" to use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg

" }}}


" {{{ LeaderF

" {subcommand}
"    file                search files
"    tag                 navigate tags using the tags file
"    function            navigate functions or methods in the buffer
"    mru                 search most recently used files
"    searchHistory       execute the search command in the history
"    cmdHistory          execute the command in the history
"    help                navigate the help tags
"    line                search a line in the buffer
"    colorscheme         switch between colorschemes
"    gtags               navigate tags using the gtags
"    self                execute the commands of itself
"    bufTag              navigate tags in the buffer
"    buffer              search buffers
"    rg                  grep using rg
"    filetype            navigate the filetype
"    command             execute built-in/user-defined Ex commands.
"    window              search windows.
"    quickfix            navigate the quickfix.
"    loclist             navigate the location list.
" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 0
" For GUI vim, the icon font can be specify like this, for example
let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"
" If needs
set ambiwidth=double

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
" Default: $HOME
"let g:Lf_CacheDirectory = expand($HOME)
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_ShowRelativePath = 0
" popup mode
" Require vim 8.1.1615+, nvim 0.4.2+
let g:Lf_WindowPosition = 'bottom'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>p"
noremap <leader>b :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>c :<C-U><C-R>=printf("Leaderf command %s", "")<CR><CR>
noremap <leader>e :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
" `function` be included in `bufTag`
noremap <leader>f :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>t :<C-U><C-R>=printf("Leaderf tag %s", "")<CR><CR>
noremap <leader>h :<C-U><C-R>=printf("Leaderf help %s", "")<CR><CR>
noremap <leader>l :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
"noremap <leader>m :<C-U><C-R>=printf("Leaderf window %s", "")<CR><CR>

" Search lines in <PATH>, but need to spell <PATH> manual.
" Like this: :Leaderf! rg -e 'hello' /home/user/test/
noremap <Leader>L :<C-U><C-R>=printf("Leaderf! rg -e %s", "")<CR>
noremap <Leader>W :<C-U><C-R>=printf("Leaderf! rg -tweb -e %s", "")<CR>
noremap <Leader>B :<C-U><C-R>=printf("Leaderf! rg -tback -e %s", "")<CR>
" search visually selected text literally
xnoremap gx :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>

" TODO: gtags, rg commands
" ===> gtags configuration for tags
" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
" noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
" noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
" "noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
" noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
" noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


" ===> ripgrep configuration for fast search

" -t, -T, -r
let g:Lf_RgConfig = [
        \ "--max-columns=150",
        \ "--type-add=web:*.{html,css,js}",
        \ "--type-add=back:*.{go,c,cpp,h,py}",
        \ "--glob=!git/*",
        \ "--smart-case",
        \ "--hidden"
    \ ]




" }}}

" {{{ signify

" default updatetime 4000ms is not good for async update
set updatetime=100
"this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = ['git', 'hg']
" mappings to jump to changed blocks
nmap <leader>ej <plug>(signify-next-hunk)
nmap <leader>ek <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" }}}

" {{{ lightline

set laststatus=2
" no use default --INSERT--
set noshowmode
" TODO: setting for pylint Warning,Error
" COLORSCHEME:
" default: powerline,
" wombat, jelllybeans, solarized dark, solarized light, one light, landscape
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right':[ ['fileformat', 'fileencoding' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ 'component':{
      \ },
      \ }

" }}}

" {{{ markdown

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = '7000'

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" }}}

" {{{ nerdtree

map <leader>d :NERDTreeToggle<CR>
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

silent autocmd BufEnter * call NERDTreeRefresh()

" }}}

" {{{ rainbow

let g:rainbow_active=1

" }}}

"hello world"
"{{{ surround documentation

" "hello world" -> cs"' -> 'hello world'
" cs'<a> -> <a>hello world</a>
" cst" ->   "hello world"
" ds" ->    hello world
" ysiw] ->  [hello] world
" cs]{ ->   { hello } world
" yssb | yss) -> ({hello} world)
" ds{ds) ->  hello world
" ysiw<em> -> <em>hello</em> world

" vim-Surround ========================================
" :1,2Commentary -> 1line-2line
" gcc -> comment the line
" gcap -> comment out a paragraph
" :g/TODO/Commentary ?
" TODO: ctrl+/ shortcut setting

" }}}

" {{{ autopairs

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" }}}

" {{{ snippets

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}

" {{{ultisnip


" }}}

" {{{ py.test documentation

" Not usually used, so dont set shortcut.
" The following commands:
" :Pytest class
" :Pytest method
" :Pytest file
" :Pytest project
" :Pytest projecttestwd " check which set of tests will be run
"
" :Pytest error
" :Pytest clear
"
" :Pytest first
" :Pytest last
" :Pytest next
" :Pytest previous
" :Pytest end


" default: py.test
" let g:pytest_executable = "py.test-3"
" deault: tests(directory)
" let g:pytest_test_dir = 'test_suite'
" default: tests.py
" let g:pytest_test_file = 'tests.py'
" }}}

" {{{ vim-go

let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 0
let g:go_fmt_fail_silently = 1

" Struct, `json` + `tab` => generate for json.Msha1()

" default: snake_case
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
" //go:generate
let g:go_highlight_generate_tags = 1

" => go lint
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" lint when save
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
" }}}

" {{{ YouCompleteMe

let g:ycm_global_ycm_extra_conf='/scripts/global_extra_conf.py'
" just for ycmd server
let g:ycm_server_python_interpreter = ''
" Be Conflict with vim-default-gt-gT.
"nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap gd :YcmCompleter GoToDefinition<CR>

" default: 1, if not clangd, will use libclang
let g:ycm_use_clangd = 1
" default: 1
let g:ycm_use_ultisnips_completer = 1
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_global_ycm_extra_conf = ''
" disable nover doc show
let g:ycm_auto_hover = ''
" Trigger documentation hover action
nmap <leader>D <plug>(YCMHover)
" enable in comments
let g:ycm_complete_in_comments = 1
" Collect from comments
let g:ycm_collect_identifiers_from_comments_and_strings = 0

" disable <leader>d shortcut
let g:ycm_key_detailed_diagnostics = ''

let g:ycm_filetype_whitelist = {
            \ 'c': 1,
            \ 'cpp': 1,
            \ 'python': 1,
            \ 'go': 1,
            \ 'vim': 1,
            \ 'sh': 1,
            \ 'zsh': 1,
            \ }

let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'leaderf': 1,
      \ 'mail': 1
      \}
let g:ycm_filepath_blacklist = {
      \ 'html': 1,
      \ 'jsx': 1,
      \ 'xml': 1,
      \}
" autocomplete triggers
let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }
" Jump new window when file is not open.
let g:ycm_goto_buffer_command = 'split-or-existing-window'
" 给出上下文中出现的符号,Mac,Windows冲突
let g:ycm_key_invoke_completion = '<C-Z>'
" cursor in foo, following command will: rename foo -> bar
" >> :YcmCompleter RefactorRename bar
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>'
" errors
" No often used
" nnoremap <leader>gl :YcmDiags<CR>


" }}}

" {{{ WhichKey

set timeoutlen=500
" leader key locate after plugins.
" load when needed
"autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
call which_key#register('<Space>', 'g:which_key_map')
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
"nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" Vim-WhichKey ===========================================
" name don't contain special char
" hide a group of non-top level mappings
" let g:which_key_map['_'] = { 'name': 'which_key_ignore' }

let g:which_key_map = {}

let g:which_key_map['?'] = [':vsp $MYVIMRC', 'vimrc']
" gcc provided by vim-surround
" shortcut for comment a line
let g:which_key_map['/'] = ['gcc']

" Key Define
"nmap ga <Plug>(EasyAlign)
"xmap ga <Plug>(EasyAlign)
" Using predefined alignment rules
"   :EasyAlign[!] [N-th] DELIMITER_KEY [OPTIONS]
":EasyAlign :
":EasyAlign =
":EasyAlign *=
":EasyAlign 3\

" Using arbitrary regular expressions
"   :EasyAlign[!] [N-th] /REGEXP/ [OPTIONS]
":EasyAlign /[:;]\+/
":EasyAlign 2/[:;]\+/
":EasyAlign */[:;]\+/
":EasyAlign **/[:;]\+/

" Leaderf buffer
let g:which_key_map.b = { 'name': 'Buffers' }
" Leader command
let g:which_key_map.c = {
            \ 'name': 'Commands',
            \ }

" YouCompleteMe show detail diagnostic
"let g:which_key_map.d = { 'name': 'YcmErrDetail' }
let g:which_key_map.d = { 'name': 'NERDTreeToggle' }
let g:which_key_map.D = { 'name': 'Doc' }

let g:which_key_map.e = {'name': 'Recent Used Files'}
let g:which_key_map.e = {
    \ 'name': '+ChangeMove',
    \ 'j':    'signify-next',
    \ 'k':    'signify-prec',
    \ }

let g:which_key_map.f = {
            \ 'name': 'Functions',
            \ }

" let g:which_key_map.i = { 'name': 'REPLToggle' }

" And vim-go shorcut (just for go)
"let g:which_key_map.g = {
"            \ 'name': '+Gotos',
"            \ }

" Leaderf help
let g:which_key_map.h = { 'name': 'Helps' }

"let g:which_key_map.k = ['Maps', 'KeySettings']

" Leaderf line
let g:which_key_map.l = {'name': 'Lines'}
" leaderf rg -tbackend in git project root.
let g:which_key_map.L = {'name': 'AllLines'}

" Leaderf commands
let g:which_key_map.p = { 'name': 'Files' }
"let g:which_key_map.P = { 'name': 'Flake8_Check' }
" PRUN()
let g:which_key_map.r = { 'name': 'Run' }
" :w<cr>
" let g:which_key_map.s = {
"     \ 'name': 'Save',
"     \ }

" Think: set `T` for pytest.
" Leaderf bugTag
let g:which_key_map.t = {
    \ 'name': '+Tags',
    \ }

" let g:which_key_map.T = { 'name' : 'Symbols' }

"let g:which_key_map.w = {
"      \ 'name' : '+Windows' ,
"      \ 'o' : ['<C-w>w',              'other-window'],
"      \ 'd' : ['<C-w>c',             'delete-window'],
"      \ '-' : ['<C-w>s',        'split-window-below'],
"      \ '|' : ['<C-w>v',        'split-window-right'],
"      \ '2' : ['<C-w>v',     'layout-double-columns'],
"      \ 'h' : ['<C-w>h',               'window-left'],
"      \ 'j' : ['<C-w>j',              'window-below'],
"      \ 'l' : ['<C-w>l',              'window-right'],
"      \ 'k' : ['<C-w>k',                 'window-up'],
"      \ 'H' : ['<C-w>10<',      'expand-window-left'],
"      \ 'J' : ['resize +10',   'expand-window-below'],
"      \ 'L' : ['<C-w>10>',     'expand-window-right'],
"      \ 'K' : ['resize -10',      'expand-window-up'],
"      \ '=' : ['<C-w>=',            'balance-window'],
"      \ 's' : ['<C-w>s',        'split-window-below'],
"      \ 'v' : ['<C-w>v',        'split-window-below'],
"      \ 'w' : ['Windows',               'fzf-window'],
"      \ }
" }}}

" {{{ gutengtags
"
"yum install -y global-ctags or global ?
set tags=./.tags;,.tags
let $GTAGSLABEL = 'pygments'
"let $GTAGSCONF = '/etc/gtags.conf'

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.git','.root','.svn','.hg','.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
" 避免多个项目 数据库 相互干扰,使用plus插件解决问题
let g:gutentags_auto_add_gtags_cscope = 0

"let g:gutentags_define_advanced_commands = 1

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" default keymap
"<leader>cs	Find symbol (reference) under cursor
"<leader>cg	Find symbol definition under cursor
"<leader>cd	Functions called by this function
"<leader>cc	Functions calling this function
"<leader>ct	Find text string under cursor
"<leader>ce	Find egrep pattern under cursor
"<leader>cf	Find file name under cursor
"<leader>ci	Find files #including the file name under cursor
"<leader>ca	Find places where current symbol is assigned
" }}}


" {{{ Abbrev
" fix words automaticily if you usually spell it incorrect.
iabbrev centre center
iabbrev fucntion function
iabbrev recieve receive
iabbrev k8s kubernetes
iabbrev githuib github
iabbrev falke8 flake8
iabbrev dcoker docker
" }}}

" }}}
