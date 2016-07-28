#!/bin/bash

installVimPackage() { DIR=$1; REPO=$2; if [ ! -d ~/.vim/bundle/"$DIR" ]; then git clone https://github.com/$REPO.git ~/.vim/bundle/"$DIR"; fi }
cpFileFromProvision() { FILE=$1; cp /project/provision/$FILE ~/$FILE; }
installNPMModulesIfNecessary() {
  PACKAGE_DIR=$1;
  if [ ! -d $PACKAGE_DIR/node_modules ]; then
    echo "installing modules in $PACKAGE_DIR"
    cd $PACKAGE_DIR && npm i
  fi
}
installNPMModuleGlobally() {
  MODULE_NAME=$1
  if [ ! -d ~/.nodenv/versions/6.3.0/lib/node_modules/$MODULE_NAME ]; then
    echo "doing: npm i -g $MODULE_NAME"
    npm i -g $MODULE_NAME
  fi
}

if ! type tree ; then
  echo "installing basic packages"
  sudo apt-get update
  sudo apt-get install -y curl git unzip ack-grep git-extras jq tree
  git config --global user.email "you@example.com" && git config --global user.name "Your Name"
fi

if [ ! -d ~/repository ]; then
  echo "cloning and setting up the repository"
  git clone https://github.com/goldfire/howler.js.git ~/repository
  cd ~/repository
  git reset --hard fcbd4749f4f94a598
  # This repo does not have .gitignore
  cp /project/provision/repository/gitignore ~/repository/.gitignore
  ln -s  /project/examples/ ~/repository/own_examples
fi

if [ ! -d ~/logs ]; then
  mkdir ~/logs
fi

cpFileFromProvision .bashrc
cpFileFromProvision .tmux.conf

# vim start
  cpFileFromProvision .vimrc

  mkdir -p ~/.vim/autoload/ ~/.vim/bundle
  if [ ! -f ~/.vim/autoload/pathogen.vim ]; then curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim > ~/.vim/autoload/pathogen.vim; fi

  installVimPackage vim-markdown plasticboy/vim-markdown
  installVimPackage syntastic scrooloose/syntastic
  installVimPackage ctrlp.vim ctrlpvim/ctrlp.vim
  installVimPackage auto-pairs jiangmiao/auto-pairs
  installVimPackage vim-better-whitespace ntpeters/vim-better-whitespace
  installVimPackage nerdcommenter scrooloose/nerdcommenter

  installVimPackage vimproc Shougo/vimproc.vim
  cd ~/.vim/bundle/vimproc && make; cd -
# vim end

if [ ! -f ~/node-installation-finished ]; then
  echo "setup node with nodenv"
  sudo add-apt-repository -y ppa:chris-lea/node.js && \
    sudo apt-get update && \
    sudo curl -O -L https://npmjs.org/install.sh | sh && \
    if [ ! -d ~/.nodenv ]; then git clone https://github.com/nodenv/nodenv.git ~/.nodenv && cd ~/.nodenv && src/configure && make -C src; fi && \
    export PATH=$PATH:/home/$USER/.nodenv/bin && \
    eval "$(nodenv init -)" && \
    if [ ! -d ~/.nodenv/plugins/node-build ]; then git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build; fi && \
    if [ ! -d .nodenv/versions/6.3.0 ]; then nodenv install 6.3.0; fi && \
    nodenv global 6.3.0 && \
    touch ~/node-installation-finished
fi

installNPMModulesIfNecessary ~/repository
installNPMModuleGlobally http-server

echo "finished provisioning"
