ABSOLUTE_DIR=$(dirname "$(readlink -f "$0")")
cd $ABSOLUTE_DIR/..

vagrant halt