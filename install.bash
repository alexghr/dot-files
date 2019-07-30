#!/usr/bin/env bash

set -o errexit
set -o nounset

cp ./.gitconfig ~/.gitconfig
cp ./.tmux.conf ~/.tmux.conf
cp ./.bash_aliases ~/.bash_aliases

