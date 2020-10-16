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

vim_config_path='~/.vim'
neovim_config_path='~/.config/nvim'
if [ -z $vim_config_path ]
then
  echo 'neovim setting directory already existed, please backup and rename it and try again!'
fi

mkdir -p $vim_config_path
git clone https://github.com/dasky92/daenvim.git $vim_config_path

echo '==============================='
echo 'start to install vim plugins...'
vim +PlugClean +PlugInstall! +qa

# settings is compatiable with vim and neovim.
ln -s $vim_config_path $neovim_config_path

sudo chown $USER $vim_config_path
sudo chown $USER $neovim_config_path

echo 'Finish! Enjoy It!'
