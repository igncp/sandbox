#!/bin/bash

MACHINE_EXISTS=$(vagrant global-status | grep "projects/angular")

ABSOLUTE_DIR=$(dirname "$(readlink -f "$0")")
cd $ABSOLUTE_DIR/..

if [ -z $MACHINE_EXISTS ]; then
  vagrant up
else
  echo "Box exists"
  vagrant provision
fi

echo "Finished!"
