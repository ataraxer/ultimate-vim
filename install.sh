#!/usr/bin/env bash

git clone --recursive https://github.com/ataraxer/ultimate-vim.git
cd ultimate-vim

dir=$(pwd)
echo $dir

ln -s   $dir/.vim          ~/
ln -s   $dir/.vimrc        ~/
ln -s   $dir/.vimrc.bundle ~/
touch ~/.vimrc.local

