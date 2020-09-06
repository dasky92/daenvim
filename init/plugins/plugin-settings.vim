
" {{{ 
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
" Require for all jedi Plugins: deoplete-jedi, vim-jedi, ncm2-jedi
"let g:python_host_prog = '/usr/bin/python'
"let g:python3_host_prog = '/usr/bin/python3'



"  =============== YouCompleteMe =============== 
" nnoremap <leader>gf :YcmCompleter FixIt<CR>
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>

" default: 1, if not clangd, will use libclang
let g:ycm_use_clangd = 1
" default: 1
let g:ycm_use_ultisnips_completer = 1
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
let g:ycm_global_ycm_extra_conf = ''
" disable nover doc show
let g:ycm_auto_hover = ''
" enable in comments
let g:ycm_complete_in_comments = 1
" Collect from comments
let g:ycm_collect_identifiers_from_comments_and_strings = 0
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

" Jump new window when file is not open.
let g:ycm_goto_buffer_command = 'split-or-existing-window'
" 给出上下文中出现的符号,Mac,Windows冲突
let g:ycm_key_invoke_completion = '<C-Z>'
" cursor in foo, following command will: rename foo -> bar
" >> :YcmCompleter RefactorRename bar
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>'
" errors
nnoremap <leader>gl :YcmDiags<CR>


"  =============== vim-flake8 =============== 
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
autocmd FileType python map <buffer> <leader>l :call flake8#Flake8()<CR>
" Show current line error
nnoremap <leader>L :call flake8#Flake8ShowError()<cr>
" lint when run python script
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

"  =============== vim-rainbow =============== 
let g:rainbow_active=1

" lightline
set laststatus=2
" no use default --INSERT--
set noshowmode
" TODO: setting for pylint Warning,Error
let g:lightline = {
      \ 'colorscheme': 'darculaOriginal',
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

" Tagbar ------------------
"toggle tagbar display
map <leader>T :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus=1

" NERDTree ----------------

" toggle nerdtree display
map <leader>D :NERDTreeToggle<CR>
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

" Fzf ----------------------------
" file finder mapping
" Custom command GGrep, search lines within git root path
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

"nnoremap <leader>ff :Files<CR>
"nmap <leader>ff :GFiles<CR>
"nmap <leader>fg :GGrep<CR>
" tags (symbols) in current file finder mapping
"nmap <leader>ft :BTag<CR>
" tags (symbols) in all files finder mapping
"nmap <leader>fT :Tags<CR>

"nmap <leader>fs :BLines<CR>
" general code finder in all files mapping
"nmap <leader>fS :Lines<CR>
" commands finder mapping
" TODO: used often???
"nmap <leader>cc :Commands<CR>
" vim help
"nmap <leader>h :Helptags<CR>
" key-map-settings
"nmap <leader>k :Maps<CR>
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
" :Buffers             Buffer list
" :Helptags
" :Filetypes
" Custom your command 'search git lines in project'

" Mapping selecting mappings
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-l> <plug>(fzf-complete-line)


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

" vim-Surround ========================================
" :1,2Commentary -> 1line-2line
" gcc -> comment the line
" gcap -> comment out a paragraph
" :g/TODO/Commentary ?
" TODO: ctrl+/ shortcut setting


" indentlint ========================================
" Enable indentline, default disabled
let g:indentLine_enabled = 1
let g:indentLine_setColors = 0
" Customize conceal color
" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'
" indentline visual character
let g:indentLine_char = '┊'


" easymotion ========================================
"
map <Leader>m <Plug>(easymotion-prefix)
" <prefix>-w    :   move to word
" <prefix>-l    :   move to line
" <prefix>-f{char}  :   move to {char}


" easymotion ========================================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" mardown-preview ===================================
" p -> start preview, P -> stop preview
nmap <leader>p <Plug>MarkdownPreview
nmap <leader>P <Plug>MarkdownPreviewStop

" }}}
