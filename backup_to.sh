#!/bin/sh

for dir in */.backup; do
    echo "# \033[32m$dir\033[0m" ;
    rsync -adPvv "$(dirname $dir)" "$1" | grep -v ' is uptodate' ;
    echo ;
    echo ;
done;
