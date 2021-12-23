# !/usr/bin/env bash

SCRIPT_DIR=`dirname -- "$0"`
SCRIPT_DIR=`cd "${SCRIPT_DIR}" && pwd`


function setup_vim() {
  local_vimrc="${SCRIPT_DIR}/.vimrc"
  user_vimrc=~/.vimrc

  echo "source ${local_vimrc}" > ${user_vimrc}
  
  mkdir -p ~/.config/nvim
  echo "source ${local_vimrc}" > ~/.config/nvim/init.vim
  
  vim -es -u ${user_vimrc} -i NONE -c "PlugInstall" -c "qa"
}
