#!/bin/bash

sym() {
    dotdir="$1"

    for filename in $(find $dotdir -name "*.symlink"); do
      ln -sf $filename ~/.$(basename $filename | sed "s/\.symlink//")
    done
}

dotfs=$(cd $(dirname $0) && pwd)

sym "$dotfs"

touch ~/fake1
git clone git@github.com:oakeyc/SecretDotfiles.git

touch ~/fake2
./SecretDotfiles/install.sh

