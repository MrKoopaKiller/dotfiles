#/usr/bin/env bash

if [[ $(uname) == 'Darwin' ]]; then
    cp -R ../fonts/*.ttf /Library/Fonts/
else
   echo "TODO"
fi