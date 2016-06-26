#!/bin/bash

addExclude() {
  sed -i "/\"exclude\"/a \"$1\"," ~/repository/modules/tsconfig.json
}

compilePlaygroundDir() {
  TARGET_DIR="hello_world"
  for PLAYGROUND_DIR in $( find ~/repository/modules/playground/src -maxdepth 1 -type d | sed "/$TARGET_DIR/d" | xargs -n1 basename | tail -n +2 ); do
    addExclude "playground/src/$PLAYGROUND_DIR"
  done
  addExclude '@angular'

  TSC="node dist/tools/tsc-wrapped/src/main"
  $TSC -p modules/tsconfig.json
}

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

cd ~/repository/

git reset --hard HEAD
git apply $SCRIPT_DIR/patch.diff

time compilePlaygroundDir
