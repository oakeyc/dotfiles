#!/bin/bash

dotdir=$(cd $(dirname $0) && pwd)

for filename in $(find $dotdir -name "*.symlink"); do
  ln -sf $filename ~/.$(basename $filename | sed "s/\.symlink//")
done
