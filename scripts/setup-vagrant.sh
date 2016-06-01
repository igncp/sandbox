set -e

if type vagrant &> /dev/null ; then
  echo "vagrant is already installed"
  exit 0
fi

VAGRANT_FILE=vagrant_1.8.1_x86_64.deb

sudo apt-get install -y curl

if [ ! -f $VAGRANT_FILE ]; then
  curl -O https://releases.hashicorp.com/vagrant/1.8.1/$VAGRANT_FILE
fi

sudo dpkg -i $VAGRANT_FILE
sudo apt-get install -f

rm $VAGRANT_FILE

echo "Finished!"
