# Install YouCompleteMe Engine(manual)

## Step1: YouCompleteMe

1. `git clone`
> git clone --recurse-submodules --shallow-submodules git@gitee.com:mirrors/youcompleteme.git ~/.vim/pack/my/start/

2. `Compile YouCompleteMe`
> cd ~/.vim/pack/my/start/YouCompleteMe/ && ./build.py --clang-completer --clangd-completer --go-completer

## Step2: Settings

> set `.ycm_extra_conf.py` for every project.
