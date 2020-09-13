# Install YouCompleteMe Engine(manual)

## Step1: YouCompleteMe

1. Install environment for compile python extension

> python yum install python2-devel

> python3 yum install python3-devel

2. `git clone`
> git clone --recurse-submodules --shallow-submodules git@gitee.com:mirrors/youcompleteme.git ~/.vim/pack/my/start/

3. `udpate submodule`

> cp sample.gitmodules dest/.gitmodules

> git submodule init && git submodule update

4. `Compile YouCompleteMe`
> cd ~/.vim/pack/my/start/YouCompleteMe/ && ./build.py --clang-completer --clangd-completer --go-completer

## Step2: Settings

> set `.ycm_extra_conf.py` for every project.
