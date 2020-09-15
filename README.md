# Configuration for neovim

This is a (neo)vim configuration for python and go, maybe include c,cpp.


## Install

Install C, C++, Python, Go executable.

```sh
brew install nodejs go python cmake
```

### Install gtags and ripgrep

`brew install global ripgrep`

### Install YouCompleteMe

- [Install YouCompleteMe](./doc/install_youcompleteme.md)

### Requirements(required by python's completion)

`sudo pip install flake8 pynvim, neovim, autopep8`

`sudo apt-get install ripgrep, ctags`

> Core: YouCompleteMe & leaderF

### TODO

Customize leaderF's project files search, and more convinent project rg lines search.
Or provide project autodiscover machnism.

Complete for javascript, css, html, typescript, vue, etc.

### 

|      key | say                 |
|    :---- | :---                |
| leader-p | commands            |
|       gd | ycm-goto-definition |
|       gr | ycm-goto-reference  |
| leader-f | files               |
| leader-l | lines               |
| leader-s | save file           |
| leader-p | flake8-lint         |
| leader-P | show flake8 error   |
| leader-R | run python/go       |
| leader-r | recent files        |
| leader-t | buffer tags         |
| leader-b | buffers             |

