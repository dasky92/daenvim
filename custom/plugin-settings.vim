
" {{{ 
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
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
" Custom command GGrep, search lines within git root path
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

"nnoremap <leader>ff :Files<CR>
nmap <leader>ff :GFiles<CR>
nmap <leader>fg :GGrep<CR>
" tags (symbols) in current file finder mapping
nmap <leader>tt :BTag<CR>
" tags (symbols) in all files finder mapping
nmap <leader>tT :Tags<CR>
" general code finder in current file mapping
nmap <leader>ss :BLines<CR>
" general code finder in all files mapping
nmap <leader>sS :Lines<CR>
" commands finder mapping
" TODO: used often???
"nmap <leader>cc :Commands<CR>
" vim help
nmap <leader>h :Helptags<CR>
" key-map-settings
nmap <leader>k :Maps<CR>
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

" }}}
