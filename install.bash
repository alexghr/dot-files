#!/usr/bin/env bash

set -o errexit
set -o nounset

function copy {
  # if no explicit destination is given then copy to "~/${src}"
  default_dst="$HOME"

  src="$1"
  dst="${2:-$default_dst}/$(basename $1)"

  mkdir -p $(dirname $dst)

  echo "Copying $src to $dst"
  cp --reflink=auto "$src" "$dst"
}

copy .gitconfig
copy .tmux.conf
copy .bash_aliases
copy .bash_ps

if [ -x "$(command -v code)" ]; then
  copy ./vscode/keybindings.json ~/.config/Code/User/
  copy ./vscode/settings.json ~/.config/Code/User/

  for plugin in $(cat ./vscode/_plugins.txt); do
    code --install-extension "$plugin"
  done
fi
