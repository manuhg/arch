#!/bin/zsh
if [ $# -eq 0 ]; then
    echo "Please enter the name of submodule to be removed"
else
    git submodule deinit -f -- $1
    rm -rf .git/modules/$1
    git rm -f $1
    rm -rf $1
fi