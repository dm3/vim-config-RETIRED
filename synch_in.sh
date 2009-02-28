#!/bin/bash
alias rm=rm
cp -vr ../vimfiles/ .
cp -v ../_vimrc .
cp -v ../_gvimrc .
git add .
git ls-files --deleted | xargs git rm
git commit
