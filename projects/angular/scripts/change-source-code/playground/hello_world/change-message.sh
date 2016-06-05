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

replaceString() {
  sed -i "s/$1/$2/" ~/repository/modules/playground/src/hello_world/index.ts
}

cd ~/repository/

git reset --hard HEAD

replaceString "this.greeting = 'howdy'" "this.greeting = 'hiyas'"
replaceString "change greeting" "change message"
replaceString "<span red>" "<span blue>"
replaceString "{selector: '\[red\]'}" "{selector: '\[blue\]'}"
replaceString "RedDec" "BlueDec"
replaceString "el.nativeElement, 'color', 'red'" "el.nativeElement, 'color', 'blue'"

time compilePlaygroundDir
