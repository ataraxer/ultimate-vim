#!/usr/bin/env bash

dir=$(pwd)
echo $dir

ln -s   $dir/.vim          ~/
ln -s   $dir/.vimrc        ~/
ln -s   $dir/.vimrc.bundle ~/
touch ~/.vimrc.local

