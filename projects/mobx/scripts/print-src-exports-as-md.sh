#!/usr/bin/env bash
# shellcheck disable=2001

findExportsOfFile() {
  FILE=$1
  EXPORTS=$(grep -E "^export " "$FILE" | sort -V | sed -r "s|^export ||; s| \{$||; s|;$||; s|[ ]+| |g")
  echo ""
  echo "### $(echo "$FILE" | sed "s|/home/vagrant/repository/src/||")"
  echo "\`\`\`ts"
  echo "$EXPORTS"
  echo "\`\`\`"
}

FILES=$(find /home/vagrant/repository/src -type f | sort -V)
while read -r FILE; do findExportsOfFile "$FILE"; done <<< "$FILES"
