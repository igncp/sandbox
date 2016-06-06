#!/bin/bash

addExclude() {
  sed -i "/\"exclude\"/a \"$1\"," ~/repository/modules/tsconfig.json
}

TARGET_DIR="key_events"

compilePlaygroundDir() {
  for PLAYGROUND_DIR in $( find ~/repository/modules/playground/src -maxdepth 1 -type d | sed "/$TARGET_DIR/d" | xargs -n1 basename | tail -n +2 ); do
    addExclude "playground/src/$PLAYGROUND_DIR"
  done
  addExclude '@angular'

  TSC="node dist/tools/tsc-wrapped/src/main"
  $TSC -p modules/tsconfig.json
}

replaceString() {
  sed -i "s/$1/$2/" ~/repository/modules/playground/src/$TARGET_DIR/index.ts
}

cd ~/repository/

git reset --hard HEAD

replaceString 'shift.enter' 'control.alt.d'
replaceString 'ShiftEnter' 'Combination'
replaceString 'shiftEnter' 'combination'


time compilePlaygroundDir
