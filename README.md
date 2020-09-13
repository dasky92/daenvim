# Configuration for neovim

This is a (neo)vim configuration for python and go, maybe include c,cpp.


## Install

Install C, C++, Python, Go executable.

### Install gtags and ripgrep

`brew install global ripgrep`

### Install YouCompleteMe

Complete for C, C++, Python, Go

### Install coc.nvim(todo)

Complete for javascript, css, html, typescript, vue, etc.

### Requirements(required by python's completion)

`sudo pip install flake8 pynvim, neovim, autopep8`

`sudo apt-get install ripgrep, ctags`

> Center: YouCompleteMe & leaderF

### TODO

Customize leaderF's Keys, rg command.


### 快捷键

|      key | say                 |
|    :---- | :---                |
|       gd | ycm-goto-definition |
|       gr | ycm-goto-reference  |
| leader-f | files               |
| leader-l | lines               |
| leader-c | commands            |
| leader-s | save file           |
| leader-p | flake8-lint         |
| leader-P | show flake8 error   |
| leader-R | run python/go       |
| leader-r | recent files        |
| leader-t | buffer tags         |
| leader-b | buffers             |

