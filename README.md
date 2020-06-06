# Configuration for neovim

This is a neovim configuration for (main)python and go.

## Install

### Requirements

`
sudo yum install exuberant-ctags silversearcher-ag
sudo pip install pyflakes pep8 autopep8 mccabe rope pycodestyle isort yapf pylama pylint pynvim
sudo pip3 install pyflakes pep8 autopep8 mccabe rope pycodestyle isort yapf pylama pylint pynvim
`
> Of Course, you first should install python and go

### Go and Python

由于众所周知的原因，你需要先设置pip国内源和go的国内源，百度一大把，这个可以自行解决。

### Download script and install

`
wget https://raw.githubusercontent.com/wanchaosoft/daenvim/master/install.sh && ./install.sh
`

> Now only test for centos

## Non-Plugins Version

YOU CAN INSTALL IT WITH:

`
wget https://raw.githubusercontent.com/wanchaosoft/daenvim/master/custom/custom-default.vim  -O .vimrc
`
## Plugins

- fzf
- nerdtree
- nerdcommenter
- ncm2(and ncm2 series of plugins that's up to you, now for go and python)
- python-mode
- vim-isort
- vim-virtualenv
- vim-go
- UltiSnips
- vim-snippets
- lightline.vim
- vim-rainbow
- tagbar
- vim-monokai-tasty
- challenger-deep-theme.vim
- vim-autoclose
- colorizer
- vim-signify
- vim-choosen
- emmet-vim
- SimpylFold

## Thanks

> When finish my neovim settings, I used the following configuration for reference, and THANKS 

- [fisadev](http://github.com/fisadev/fisa-vim-config)
- `vimawesome.com` for plugins
- [k-vim](https://github.com/wklken/k-vim)
- [b-vim](https://github.com/nine2/b-vim)

## Congratulations

Just enjoy yourself !
