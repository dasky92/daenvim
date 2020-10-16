#! /bin/bash

# ======= Download YouCompleteMe
set -e
set -u
#VIM_PATH='~/.vim'
VIM_PATH="$HOME/tempvim"
ROOT=${VIM_PATH}/pack/my/start
YOU_COMPLETE_ME=${ROOT}/youcompleteme
YCM_YCMD=${YOU_COMPLETE_ME}/third_party/ycmd
YCM_YCMD_JEDI=${YCM_YCMD}/third_party/jedi_deps/jedi
YCM_YCMD_NUMPYDOC=${YCM_YCMD}/third_party/jedi_deps/numpydoc
YCM_YCMD_WATCHDOG=${YCM_YCMD}/third_party/watchdog_deps/pathtools

if [ -e $VIM_PATH ]; then
  mkdir -p $VIM_PATH
fi

# Update `YouCompleteMe` and its' direct submodule
git clone https://gitee.com/mirrors/youcompleteme.git $YOU_COMPLETE_ME

cd ${YOU_COMPLETE_ME}
cat $HOME/.vim/scripts/youcompleteme_gitmodules > .gitmodules

git submodule update --init

# Update ycmd
cd ${YCM_YCMD}
cat $HOME/.vim/scripts/ycm_ycmd_gitmodules > .gitmodules
echo "third_party/" >> .gitignore
git submodule update --init

# Update ycmd_jedi
cd ${YCM_YCMD_JEDI}
cat $HOME/.vim/scripts/ycm_ycmd_jedi_gitmodules > .gitmodules
echo "third_party/" >> .gitignore
git submodule update --init

# Update ycmd_jedi_numpydoc
cd ${YCM_YCMD_NUMPYDOC}
cat $HOME/.vim/scripts/ycm_numpydoc_gitmodules> .gitmodules
git submodule update --init

# Update ycmd_watchdog_pathtools
cd ${YCM_YCMD_WATCHDOG}
cat $HOME/.vim/scripts/ycm_pathtools_gitmodules > .gitmodules
git submodule update --init

# ======= Tip: Install YouCompleteMe
echo "YouCompleteMe Download Finished!"
echo "You can execute './install.py --all' to install all engine."
echo "Or './install.py --clangd-completer --go-completer' to install you select."
