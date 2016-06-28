cd ~/repository

git reset --hard

tail -n 8 ~/repository/src/index.js | sed "/./p" | sed -r "s/([a-zA-Z])([a-zA-Z])/\1*/g" | vim -

