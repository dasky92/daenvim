#!/bin/bash

echo '==============================='
echo 'start to install dependences...'
case "$OSTYPE" in
    darwin*)
      brew install vim git pip curl
      ;;
    linux*)
      sudo apt-get install vim exuberant-ctags git pip curl
      ;;
    *)
      echo "unknown: OS: $OSTYPE, U should install dependences by yourself"
      ;;
esac

sudo pip install pep8 autopep8 pycodestyle flake8 pyflakes isort mccabe pylint pynvim

echo '==============================='
echo 'start to download vimrc/init.vim file'

nvim_config_path='~/.config/nvim'
if [ -z $nvim_config_path ]
then
  echo 'neovim setting directory already existed, please backup and rename it and try again!'
fi

mkdir -p ~/.config/
cd ~/.config/
git clone https://github.com/wanchaosoft/daenvim.git nvim
# pycodestyle软连接到~/.config目录，Required by autopep8, pymode
ln -s ./nvim/pycodestyle ./pycodestyle
sudo chown $USER ~/.config/pycodestyle

echo '==============================='
echo 'start to install vim plugins...'
nvim +PlugClean +PlugInstall! +qa

sudo chown $USER ~/.config/nvim/
echo 'down! enjoy it!'
