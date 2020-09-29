"  =============== YouCompleteMe =============== 
"
let g:ycm_global_ycm_extra_conf='../../scripts/global_extra_conf.py'
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


