
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

" }}}
