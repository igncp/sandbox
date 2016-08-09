#!/bin/bash

cpFileFromProvision() { FILE=$1; cp /project/provision/$FILE ~/$FILE; }
installNPMModulesIfNecessary() {
  PACKAGE_DIR=$1
  if [ ! -d $PACKAGE_DIR/node_modules ]; then
    echo "installing modules in $PACKAGE_DIR"
    cd $PACKAGE_DIR && npm i
  fi
}
installNPMModulesGlobally() {
  for MODULE_NAME in "$@"; do
    if [ ! -d ~/.nodenv/versions/6.3.0/lib/node_modules/$MODULE_NAME ]; then
      echo "doing: npm i -g $MODULE_NAME"
      npm i -g $MODULE_NAME
    fi
  done
}
installVimPackage() {
  REPO=$1
  DIR=$(echo $REPO | sed -r "s|.+/(.+)|\1|") # foo/bar => bar
  EXTRA_CMD=$2
  if [ ! -d ~/.vim/bundle/"$DIR" ]; then
    git clone https://github.com/$REPO.git ~/.vim/bundle/"$DIR"
    if [[ ! -z $EXTRA_CMD ]]; then eval $EXTRA_CMD; fi
  fi
}

if ! type tree ; then
  echo "installing basic packages"
  sudo apt-get update
  sudo apt-get install -y vim-nox # for vim neocomplete
  sudo apt-get install -y curl git unzip ack-grep git-extras jq tree
  git config --global user.email "you@example.com" && git config --global user.name "Your Name"
fi

if [ ! -d ~/repository ]; then
  echo "cloning and setting up the repository"
  git clone https://github.com/mobxjs/mobx.git ~/repository
  cd ~/repository
  git reset --hard 59fe84c6d183319837
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

  installVimPackage plasticboy/vim-markdown
  installVimPackage leafgarland/typescript-vim
  installVimPackage scrooloose/syntastic
  installVimPackage ctrlpvim/ctrlp.vim
  installVimPackage jiangmiao/auto-pairs
  installVimPackage ntpeters/vim-better-whitespace
  installVimPackage scrooloose/nerdcommenter
  installVimPackage vim-scripts/cream-showinvisibles
  installVimPackage nathanaelkane/vim-indent-guides
  installVimPackage airblade/vim-gitgutter
  installVimPackage othree/yajs.vim
  installVimPackage shougo/neocomplete.vim
  installVimPackage shougo/vimproc.vim "cd ~/.vim/bundle/vimproc.vim && make; cd -"

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
installNPMModulesGlobally http-server forever eslint babel-eslint phantomjs mermaid

if [[ $(ps aux | grep "node_modules\/forever" | grep "http-server" | wc -l) = "0" ]]; then
  forever start ~/.nodenv/versions/6.3.0/bin/http-server -p9000 -s -c-1 --cors -- ~/repository
fi

rm -f ~/repository/own_examples
ln -s /project/examples ~/repository/own_examples

rm -f ~/repository/own_diagrams
ln -s /project/docs/diagrams ~/repository/own_diagrams

echo "finished provisioning"
