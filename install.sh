#!/bin/bash

echo '==============================='
echo 'start to install dependences...'
case "$OSTYPE" in
    darwin*)
      brew install gtags ripgrep cmake
      ;;
    linux*)
      sudo apt-get install ripgrep cmake
      ;;
    *)
      echo "unknown: OS: $OSTYPE, U should install dependences by yourself"
      ;;
esac

sudo pip install flake8 autopep8 pyvim neovim

echo '==============================='
echo 'start to download vimrc/init.vim file'

nvim_config_path='~/.config/nvim'
if [ -z $nvim_config_path ]
then
  echo 'neovim setting directory already existed, please backup and rename it and try again!'
fi

mkdir -p ~/.vim/
cd ~/.vim/
git clone https://github.com/dasky92/daenvim.git ~/.vim

#sudo chown $USER ~/.config/pycodestyle

echo '==============================='
echo 'start to install vim plugins...'
nvim +PlugClean +PlugInstall! +qa

sudo chown $USER ~/.vim
echo 'Finish! Enjoy It!'
