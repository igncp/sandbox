#!/usr/bin/env bash
# shellcheck disable=2038


ROOT_DIT=/project/docs/diagrams

generateDiagram() {
  FILE_PATH=$1
  DIR=$(dirname "$FILE_PATH")
  PNG_DIR=$(echo "$DIR" | sed -r "s_/mmds($|/)_/pngs\1_")

  mkdir -p "$PNG_DIR"
  mermaid -o "$PNG_DIR" "$FILE_PATH" > /dev/null
  echo "Converted: $FILE_PATH"
}

rm -rf $ROOT_DIT/pngs
mkdir $ROOT_DIT/pngs

# Required to use the function with xargs
export -f generateDiagram

find $ROOT_DIT/mmds -name "*.mmd" -type f | xargs -n 1 -P 10 -I {} bash -c 'generateDiagram "$@"' _ {}
