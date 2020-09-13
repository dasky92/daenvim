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


