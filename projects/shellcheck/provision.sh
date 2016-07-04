#!/bin/bash

installVimPackage() { DIR=$1; REPO=$2; if [ ! -d ~/.vim/bundle/"$DIR" ]; then git clone https://github.com/$REPO.git ~/.vim/bundle/"$DIR"; fi }

if ! type tree ; then
  echo "installing basic packages"
  sudo apt-get update
  sudo apt-get install -y curl git unzip ack-grep git-extras tree
  git config --global user.email "you@example.com" && git config --global user.name "Your Name"
fi

if [ ! -d ~/repository ]; then
  echo "cloning and setting up the repository"
  git clone https://github.com/koalaman/shellcheck.git ~/repository
  cd ~/repository
  git reset --hard be4df190d155acdc5b
fi

if [ ! -d ~/logs ]; then
  mkdir ~/logs
fi

# .bashrc config start
cat > ~/.bashrc <<- EOM
cd ~/repository
export PATH=$PATH:~/.local/bin
bind '"\C-f":vi-fWord'
bind '"\C-b":vi-bWord'
PS1='${debian_chroot:+($debian_chroot)}\n\u@\h: \W$(__git_ps1) · '

alias rm="rm -rf"
alias ll="ls -lah"
alias ls="ls -lah"
EOM
# .bashrc config end

# vim start
cat > ~/.vimrc <<- EOM
execute pathogen#infect()
filetype plugin indent on
syntax on
set nobackup
set noswapfile
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Space> @d
let g:vim_markdown_folding_disabled = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
EOM

mkdir -p ~/.vim/autoload/ ~/.vim/bundle
if [ ! -f ~/.vim/autoload/pathogen.vim ]; then curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim > ~/.vim/autoload/pathogen.vim; fi

installVimPackage vim-markdown plasticboy/vim-markdown
installVimPackage syntastic scrooloose/syntastic
installVimPackage ctrlp.vim ctrlpvim/ctrlp.vim
installVimPackage vimproc Shougo/vimproc.vim
cd ~/repository/.vim/bundle/vimproc && make; cd -
installVimPackage ghcmod.vim eagletmt/ghcmod-vim
# vim end

# tmux start
cat > ~/.tmux.conf <<- EOM
set -g status off
set-window-option -g xterm-keys on
EOM
# tmux end

if ! type cabal ; then
  echo "installing cabal"
  # Needs a recent version of cabal (with the repl command)
  cd ~ && \
    curl -O https://www.haskell.org/cabal/release/cabal-install-1.24.0.0/cabal-install-1.24.0.0-x86_64-unknown-linux.tar.gz && \
    tar xvzf cabal-install-1.24.0.0-x86_64-unknown-linux.tar.gz && \
    rm cabal-install-1.24.0.0-x86_64-unknown-linux.tar.gz && \
    sudo mv cabal /usr/bin/ && \
    cabal install QuickCheck json regex-tdfa
fi

if ! type stack ; then
  echo "installing stack"
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 575159689BEFB442 && \
    echo 'deb http://download.fpcomplete.com/ubuntu trusty main'|sudo tee /etc/apt/sources.list.d/fpco.list && \
    sudo apt-get update && sudo apt-get install stack -y && \
    stack setup && \
    stack upgrade --git && \
    echo 'stack runghc -- $@' > ~/.local/bin/runghc && \
    chmod -R +x ~/.local/bin/ && \
    cd ~/repository && \
    stack install && \
    stack install ghc-mod
fi

echo "finished provisioning"
