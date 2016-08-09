#!/usr/bin/env bash

ROOT_DIT=/project/docs/diagrams

generateDiagram() {
  FILE=$1
  DIR=$(dirname $FILE)

  mermaid -p -o $DIR $FILE
}

find $ROOT_DIT -name "*.mmd.png" | xargs rm

# Required to use the function with xargs
export -f generateDiagram

find $ROOT_DIT -name "*.mmd" | xargs -n 1 -P 10 -I {} bash -c 'generateDiagram "$@"' _ {}
