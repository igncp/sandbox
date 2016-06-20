replaceString() { sed -i "s/$1/$2/" $3; }

installModulesIfNecessary() {
  PACKAGE_DIR=$1;
  if [ ! -d $PACKAGE_DIR/node_modules ]; then
    echo "installing modules in $PACKAGE_DIR"
    cd $PACKAGE_DIR && npm i
  fi
}

installModulesIfNecessary ~/repository/examples/counter
replaceString "3000" "9000" ~/repository/examples/counter/server.js
replaceString "cheap-module-eval-source-map" "source-map" ~/repository/examples/counter/webpack.config.js
sed -i "6i debugger;" ~/repository/examples/counter/index.js

installModulesIfNecessary ~/repository/examples/async
replaceString "3000" "9000" ~/repository/examples/async/server.js
