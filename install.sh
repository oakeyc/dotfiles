#!/bin/bash

sym() {
    dotdir="$1"

    for filename in $(find $dotdir -name "*.symlink"); do
      ln -sf $filename ~/.$(basename $filename | sed "s/\.symlink//")
    done
}

dotfs=$(cd $(dirname $0) && pwd)

sym "$dotfs"

git clone git@github.com:oakeyc/SecretDotfiles.git ~/.dotfiles/SecretDotfiles

export PATH=$PATH:~/.dotfiles/SecretDotfiles

~/.dotfiles/SecretDotfiles/install.sh

