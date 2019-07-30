#!/usr/bin/env bash

set -o errexit
set -o nounset

function copy {
  # if no explicit destination is given then copy to "~/${src}"
  default_dst="$HOME/$(basename $1)"

  src="$1"
  dst="${2:-$default_dst}"

  echo "Copying $src to $dst"
  cp --reflink=auto "$src" "$dst"
}

copy .gitconfig
copy .tmux.conf
copy .bash_aliases
