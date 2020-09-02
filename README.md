# Configuration for neovim

This is a neovim configuration for (main)python and go.

## Install

### Requirements(required by pymode)

> Of Course, you first should install python and go

`sudo pip install jedi pyflakes pep8 autopep8 mccabe rope pycodestyle isort yapf
pylama pylint pynvim`

### Go and Python

由于众所周知的原因，你需要先设置pip国内源和go的国内源，百度一大把，这个可以自行解决。

### Download script and install

`wget https://raw.githubusercontent.com/dasky92/daenvim/master/install.sh && 
chmod 777 install.sh && ./install.sh`

## Non-Plugins Version

`/custom/default.vim` is like `.vimrc`, no plugins.
You can wget it and save as .vimrc

YOU CAN INSTALL IT WITH:

`wget https://raw.githubusercontent.com/dasky92/daenvim/master/custom/custom-default.vim  -O .vimrc`

## Plugins

### common plugins

- fzf
- nerdtree
- nerdcommenter
- vim-snippets
- lightline.vim
- vim-rainbow
- tagbar
- vim-autoclose
- colorizer
- vim-signify
- emmet-vim
- SimpylFold

### autocomplete

- coc.nvim for different program language

### go plugins

- vim-go

### themes

- gruvbox

## Thanks

> When finish my neovim settings, I used the following configuration for
reference, and THANKS

- [fisadev](http://github.com/fisadev/fisa-vim-config)
- `[vimawesome.com](vimawesome.com)` for plugins
- [k-vim](https://github.com/wklken/k-vim)
- [b-vim](https://github.com/nine2/b-vim)

## Congratulations

Just enjoy yourself !
