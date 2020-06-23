
" {{{ Download plug.vim
let using_neovim = has('nvim')
if using_neovim
    let vim_config_root_path = '~/.config/nvim/'
else
    let vim_config_root_path = '~/.vim/'
endif

let plug_begin = expand(vim_config_root_path) . 'plugged'
let vim_plug_path = expand(vim_config_root_path) . 'autoload/plug.vim'

let vim_plug_need_install = 0

if !filereadable(vim_plug_path)
    echo "Installing Vim-Plug"
    echo ""
    if using_neovim
	silent !mkdir -p ~/.config/nvim/autoload
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
	silent !mkdir -p ~/.vim/autoload
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    let vim_plug_need_install = 1
endif

if vim_plug_need_install 
    :execute 'source '.fnamescape(vim_plug_path)
endif
" }}}
