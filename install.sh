#!/bin/bash

set -e
set -u

install_vim(){
    echo '==============================='
    echo 'start to install dependences...'
    echo '==============================='
    case "$OSTYPE" in
        darwin*)
          brew install global ripgrep cmake
          ;;
        linux*)
          sudo apt-get install global ripgrep cmake
          ;;
        *)
          echo "unknown: OS: $OSTYPE, U should install dependences by yourself"
          exit 1
          ;;
    esac

    sudo pip install flake8 autopep8 pyvim neovim

    echo '==================================='
    echo 'start to download vim configuration'
    echo '==================================='

    vim_config_path="$HOME/.vim"
    neovim_config_path="$HOME/.config/nvim"
    if [ -z "$vim_config_path" ]
    then
      echo 'neovim setting directory already existed, please backup and rename it and try again!'
      exit 1
    fi

    mkdir -p "$vim_config_path"
    git clone https://github.com/dasky92/daenvim.git "$vim_config_path"

    echo '==============================='
    echo 'start to install vim plugins...'
    echo '==============================='
    vim +PlugClean +PlugInstall! +qa

    # settings is compatiable with vim and neovim.
    ln -s "$vim_config_path" "$neovim_config_path"

    sudo chown "$USER" "$vim_config_path"
    sudo chown "$USER" "$neovim_config_path"

    echo 'vim installation finished!'
}

download_youcompleteme(){
  echo '==============================='
  echo 'start to install YouCompleteMe '
  echo '==============================='

  VIM_PATH="$HOME/tempvim"
  ROOT=${VIM_PATH}/pack/my/start
  YOU_COMPLETE_ME=${ROOT}/youcompleteme
  YCM_YCMD=${YOU_COMPLETE_ME}/third_party/ycmd
  YCM_YCMD_JEDI=${YCM_YCMD}/third_party/jedi_deps/jedi
  YCM_YCMD_NUMPYDOC=${YCM_YCMD}/third_party/jedi_deps/numpydoc
  YCM_YCMD_WATCHDOG=${YCM_YCMD}/third_party/watchdog_deps/pathtools

  if [ -e "$VIM_PATH" ]; then
    mkdir -p "$VIM_PATH"
  fi

  # Update `YouCompleteMe` and its' direct submodule
  git clone https://gitee.com/mirrors/youcompleteme.git "$YOU_COMPLETE_ME"

  # Update youcompleteme gitmodules

  cd "${YOU_COMPLETE_ME}"

  cat << EOF > .gitmodules
[submodule "third_party/requests-futures"]
	path = third_party/requests-futures
	url = https://gitee.com/iprintf/requests-futures
[submodule "third_party/ycmd"]
	path = third_party/ycmd
    url = https://gitee.com/dasky92/ycm_ycmd.git
[submodule "third_party/requests_deps/idna"]
	path = third_party/requests_deps/idna
	url = https://gitee.com/mirrors/idna.git
[submodule "third_party/requests_deps/certifi"]
	path = third_party/requests_deps/certifi
	url = https://gitee.com/mirrors/python-certifi.git
[submodule "third_party/requests_deps/chardet"]
	path = third_party/requests_deps/chardet
	url = https://gitee.com/mirrors/chardet.git
[submodule "third_party/requests_deps/urllib3"]
	path = third_party/requests_deps/urllib3
	url = https://gitee.com/mirrors/urllib3.git
[submodule "third_party/requests_deps/requests"]
	path = third_party/requests_deps/requests
	url = https://gitee.com/mirrors/Requests.git
EOF

  git submodule update --init

  # Update ycmd gitmodules
  cd "${YCM_YCMD}"

  cat << EOF > .gitmodules
[submodule "third_party/bottle"]
	  path = third_party/bottle
    url = https://gitee.com/dasky92/ycm_bottle.git
[submodule "third_party/waitress"]
    path = third_party/waitress
    url = https://gitee.com/mirrors/waitress.git
[submodule "third_party/requests"]
    path = third_party/requests_deps/requests
    url = https://gitee.com/mirrors/Requests.git 
[submodule "third_party/jedi"]
	  path = third_party/jedi_deps/jedi
    url = https://gitee.com/dasky92/ycm_jedi.git
[submodule "third_party/jedi_deps/numpydoc"]
	  path = third_party/jedi_deps/numpydoc
    url = https://gitee.com/dasky92/ycm_numpydoc.git
[submodule "third_party/parso"]
	  path = third_party/jedi_deps/parso
    url = https://gitee.com/dasky92/ycm_parso.git
[submodule "third_party/cregex"]
	  path = third_party/cregex
    url = https://gitee.com/dasky92/ycm_regex.git
[submodule "third_party/urllib3"]
    path = third_party/requests_deps/urllib3
    url = https://gitee.com/mirrors/urllib3.git
[submodule "third_party/chardet"]
    path = third_party/requests_deps/chardet
    url = https://gitee.com/mirrors/chardet.git
[submodule "third_party/certifi"]
    path = third_party/requests_deps/certifi
    url = https://gitee.com/mirrors/python-certifi.git
[submodule "third_party/idna"]
    path = third_party/requests_deps/idna
    url = https://gitee.com/mirrors/idna.git
[submodule "third_party/watchdog_deps/pathtools"]
    path = third_party/watchdog_deps/pathtools
    url = https://gitee.com/dasky92/ycm_pathtools.git
[submodule "third_party/watchdog"]
    path = third_party/watchdog_deps/watchdog
    url = https://gitee.com/mirrors/watchdog.git
EOF

  echo "third_party/" >> .gitignore
  git submodule update --init

  # Update ycmd_jedi gitmodules
  cd "${YCM_YCMD_JEDI}"

  cat << EOF > .gitmodules
[submodule "jedi/third_party/typeshed"]
    path = jedi/third_party/typeshed
    url = https://gitee.com/dasky92/ycm_jedi_typeshed.git
[submodule "jedi/third_party/django-stubs"]
    path = jedi/third_party/django-stubs
    url = https://gitee.com/dasky92/ycm_ycmd_jedi_django-stubs.git
EOF

  echo "third_party/" >> .gitignore
  git submodule update --init

  # Update ycmd_jedi_numpydoc
  cd "${YCM_YCMD_NUMPYDOC}"

  cat << EOF > .gitmodules
[submodule "doc/scipy-sphinx-theme"]
    path = doc/scipy-sphinx-theme
    url = https://gitee.com/dasky92/ycm_scipy-sphinx-theme.git
EOF

  git submodule update --init

  # Update ycmd_watchdog_pathtools
  cd "${YCM_YCMD_WATCHDOG}"

  cat << EOF > .gitmodules
[submodule "docs/source/_themes"]
    path = docs/source/_themes
    url = https://gitee.com/dasky92/ycm_flask-sphinx-themes.git
EOF

  git submodule update --init

  # ======= Tip: Install YouCompleteMe
  echo "YouCompleteMe Download Finished!"
  echo "You can execute './install.py --all' to install all autocompletation engine."
  echo "Or './install.py --clangd-completer --go-completer' to install you select."
}

print_help(){
  echo "Usage:"
  echo "        ./install.sh [Option]"
  echo "Option:"
  echo "        -h/--help         print help"
  echo "        -a/--all          install vim and youcompleteme"
  echo "        -v/--vim          install vim" 
  echo "        -y/--ycm          install youcompleteme"
}


case "$1" in
  -a|--all)
    install_vim
    download_youcompleteme
    ;;
  -v|--vim)
    install_vim
    ;;
  -y|--ycm)
    download_youcompleteme
    ;;
  -h|--help)
    print_help
    ;;
  *)
    echo "Don't make sense, ask for help: ./install.sh --help" 
    ;;
esac

