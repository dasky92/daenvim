
" ================ ColorScheme Settings ================
" ======================================================
if has('gui_running') || using_neovim || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
    " colorscheme gruvbox
    " colorscheme molokai
    colorscheme darcula
    set termguicolors
else
    colorscheme delek
endif
