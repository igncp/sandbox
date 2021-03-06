#!/bin/bash

appendIfLineDoesNotExist() { LINE=$1 && FILE=$2 && grep -q -F "$LINE" $FILE || echo $LINE >> $FILE; }

. ~/.bashrc

if ! type tree ; then
  echo "install basic packages"
  sudo apt-get update
  sudo apt-get install -y curl git unzip ack-grep git-extras tree
  git config --global user.email "you@example.com" && git config --global user.name "Your Name"
fi

if [ ! -f ~/node-installation-finished ]; then
  echo "setup node with nodenv"
  sudo add-apt-repository -y ppa:chris-lea/node.js && \
    sudo apt-get update && \
    sudo curl -O -L https://npmjs.org/install.sh | sh && \
    if [ ! -d ~/.nodenv ]; then git clone https://github.com/nodenv/nodenv.git ~/.nodenv && cd ~/.nodenv && src/configure && make -C src; fi && \
    appendIfLineDoesNotExist 'export PATH=$PATH:/home/$USER/.nodenv/bin' ~/.bashrc && \
    appendIfLineDoesNotExist 'eval "$(nodenv init -)"' ~/.bashrc && \
    export PATH=$PATH:/home/$USER/.nodenv/bin && \
    eval "$(nodenv init -)" && \
    if [ ! -d ~/.nodenv/plugins/node-build ]; then git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build; fi && \
    if [ ! -d .nodenv/versions/5.6.0 ]; then nodenv install 5.6.0; fi && \
    nodenv global 5.6.0 && \
    touch ~/node-installation-finished
fi

export PATH=$PATH:/home/$USER/.nodenv/bin
eval "$(nodenv init -)"
NODE_MODULES_PATH=~/.nodenv/versions/5.6.0/lib/node_modules/

if [ ! -d /usr/local/dart-sdk ]; then
  echo "downloading dart"
  curl -s -O https://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/dartsdk-linux-x64-release.zip  > /dev/null && \
    unzip dartsdk-linux-x64-release.zip > /dev/null && \
    rm dartsdk-linux-x64-release.zip && \
    appendIfLineDoesNotExist "export DART_EDITOR_DIR='/usr/local/'" ~/.bashrc && \
    appendIfLineDoesNotExist "export DART_SDK='/usr/local/dart-sdk/'" ~/.bashrc && \
    appendIfLineDoesNotExist 'export PATH=$PATH:"$DART_SDK"/bin' ~/.bashrc && \
    sudo mv dart-sdk /usr/local/ && \
    sudo chown -R $USER:$USER /usr/local/dart-sdk
fi

if [ ! -d ~/repository ]; then
  echo "cloning and setting up the repository"
  git clone https://github.com/angular/angular.git ~/repository
  cd ~/repository
  git reset --hard 420e83a396ed5ae
fi

if [ ! -d ~/logs ]; then
  mkdir ~/logs
fi

# .bashrc config start
appendIfLineDoesNotExist 'export PATH=$PATH:/home/vagrant/.nodenv/versions/5.6.0/bin/' ~/.bashrc && \
appendIfLineDoesNotExist 'cd ~/repository' ~/.bashrc
appendIfLineDoesNotExist 'bind '"'"'"\C-f":vi-fWord'"'"'' ~/.bashrc
appendIfLineDoesNotExist 'bind '"'"'"\C-b":vi-bWord'"'"'' ~/.bashrc
appendIfLineDoesNotExist 'source <(npm completion)' ~/.bashrc
appendIfLineDoesNotExist 'PS1='\''${debian_chroot:+($debian_chroot)}\n\u@\h: \W$(__git_ps1) · '\''' ~/.bashrc
# .bashrc config end

# .bashrc alias start (for bash expansion)
appendIfLineDoesNotExist 'alias rm="rm -rf"' ~/.bashrc
appendIfLineDoesNotExist 'alias pdm="/project/dir-structure/modules/"' ~/.bashrc
appendIfLineDoesNotExist 'alias pdma="/project/dir-structure/modules/@angular/"' ~/.bashrc
appendIfLineDoesNotExist 'alias pdmp="/project/dir-structure/modules/playground/"' ~/.bashrc
# .bashrc alias start

# vim start
touch ~/.vimrc
cat > ~/.vimrc <<- EOM
execute pathogen#infect()
filetype plugin indent on
syntax on
set nobackup
set number
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Space> @d
let g:vim_markdown_folding_disabled = 1
EOM

mkdir -p ~/.vim/autoload/ ~/.vim/bundle
if [ ! -f ~/.vim/autoload/pathogen.vim ]; then curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim > ~/.vim/autoload/pathogen.vim; fi
if [ ! -d ~/.vim/bundle/typescript-vim ]; then git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/bundle/typescript-vim; fi
if [ ! -d ~/.vim/bundle/vim-markdown ]; then git clone https://github.com/plasticboy/vim-markdown.git ~/.vim/bundle/vim-markdown; fi
# vim end

# tmux start
cat > ~/.tmux.conf <<- EOM
set -g status off
set-window-option -g xterm-keys on
EOM
# tmux end

if [[ $(ps aux | grep "node_modules\/forever" | grep "http-server" | wc -l) = "0" ]]; then
  $NODE_MODULES_PATH/forever/bin/forever start -a -l ~/logs/forever.log -- $NODE_MODULES_PATH/http-server/bin/http-server ~/repository/dist -p 9000 -c-1
fi

if [ ! -f /etc/init.d/xvfb ]; then 
  curl https://gist.githubusercontent.com/dmitriy-kiriyenko/974392/raw/337a72368029046f28f0391c914c02d0ef3ad9d7/xvfb > xvfb && sudo mv xvfb /etc/init.d/ && chown $USER:$USER /etc/init.d/xvfb
fi

if [ ! -d ~/repository/node_modules ]; then
  echo "installing modules"
  cd ~/repository
  npm i
fi

if ! type forever ; then
  npm i -g http-server forever
fi

if [ ! -d ~/repository/dist ]; then
  cd ~/repository && git reset --hard HEAD && ./build.sh
fi

if [[ $(cd ~/repository && git rev-parse HEAD | grep -o ^......) = "420e83" ]]; then
  echo "commiting dist"
  cd ~/repository && \
    git reset --hard HEAD && \
    sed -i '/set -e -o pipefail/d' build.sh && \
    sed -i '/\/dist\//d' .gitignore && \
    sed -i '/*.js_/d' .gitignore && \
    sed -i '/*.js.map/d' .gitignore && \
    time ./build.sh;
    git add -A . && \
    git commit -m "dist" --quiet
fi

echo "finished provisioning"
