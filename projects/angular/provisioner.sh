#!/bin/bash

appendIfLineDoesNotExist() { LINE=$1 && FILE=$2 && grep -q -F $LINE $FILE || echo $LINE >> $FILE; }

. ~/.bashrc

if ! type tree ; then
  echo "install basic packages"
  sudo apt-get update
  sudo apt-get install -y curl git tree
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
  git clone https://github.com/angular/angular.git repository
fi

cd repository
git reset --hard 420e83a396ed5ae

if [ ! -d ~/repository/node_modules ]; then
  export PATH=$PATH:/home/$USER/.nodenv/bin
  eval "$(nodenv init -)"
  echo "installing modules"
  cd ~/repository
  npm i
fi

appendIfLineDoesNotExist 'cd ~/repository' ~/.bashrc

cd ~/repository
sed -i '/set -e -o pipefail/d' build.sh
# sh build

echo "finished provisioning"
