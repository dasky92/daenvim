#!/bin/bash

using_vim=1

echo '==============================='
echo 'start to install dependences...'
case "$OSTYPE" in
    darwin*)
      brew install global ripgrep cmake
      ;;
    linux*)
      sudo apt-get install global ripgrep cmake
      ;;
    *)
      echo "unknown: OS: $OSTYPE, U should install dependences by yourself"
      ;;
esac

sudo pip install flake8 autopep8 pyvim neovim

echo '==============================='
echo 'start to download (n)vim configuration.'

root_config_path='~/.config/nvim'
if [ -z $root_config_path ]
then
  echo 'neovim setting directory already existed, please backup and rename it and try again!'
fi

mkdir -p $root_config_path
git clone https://github.com/dasky92/daenvim.git $root_config_path

echo '==============================='
echo 'start to install vim plugins...'
vim +PlugClean +PlugInstall! +qa

sudo chown $USER ~/.vim
echo 'Finish! Enjoy It!'
