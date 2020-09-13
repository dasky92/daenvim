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
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
" Require vim 8.1.1615+, nvim 0.4.2+
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>f"
noremap <leader>b :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>p :<C-U><C-R>=printf("Leaderf command %s", "")<CR><CR>
noremap <leader>r :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>t :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>h :<C-U><C-R>=printf("Leaderf help %s", "")<CR><CR>

" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>

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

let g:Lf_RgConfig = [
        \ "--max-columns=150",
        \ "--type-add web:*.{html,css,js}*",
        \ "--type-add backend:*.{go,c,cpp,h,py}*",
        \ "--glob=!git/*",
        \ "--hidden"
    \ ]

"" search word under cursor, the pattern is treated as regex, and enter normal mode directly
"noremap <leader>fe :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
"
"" search word under cursor, the pattern is treated as regex,
"" append the result to previous search results.
"noremap <leader>fa :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>
"
"" search word under cursor literally only in current buffer
""noremap <leader>fb :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR>
"
"" search word under cursor literally in all listed buffers
"noremap <leader>fB :<C-U><C-R>=printf("Leaderf! rg -F --all-buffers -e %s ", expand("<cword>"))<CR>
"
"" search visually selected text literally, don't quit LeaderF after accepting an entry
"xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>
"
"" recall last search. If the result window is closed, reopen it.
"noremap <leader>fR :<C-U>Leaderf! rg --recall<CR>
"
"" search word under cursor in *.h and *.cpp files.
"noremap <Leader>fs :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.{h,c,cpp,go,py}", expand("<cword>"))<CR>

