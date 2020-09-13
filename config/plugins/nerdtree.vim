
" NERDTree ----------------

" toggle nerdtree display
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

autocmd BufEnter * call NERDTreeRefresh()
