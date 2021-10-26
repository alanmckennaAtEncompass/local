# !/usr/bin/env bash

function setup_vim() {
  local current_working_dir
  current_working_dir="$1"

  local_vimrc="${current_working_dir}/vim/.vimrc"
  user_vimrc=~/.vimrc

  echo "source ${local_vimrc}" >> ${user_vimrc}

  vim -es -u ${user_vimrc} -i NONE -c "PlugInstall" -c "qa"
}

function setup_tmux() {
  local current_working_dir
  current_working_dir="$1"

  local_tmux_conf="${current_working_dir}/tmux/.tmux.conf"
  user_tmux_conf=~/.tmux.conf

  ln -sf ${local_tmux_conf} ${user_tmux_conf}
}

current_working_dir="$(pwd)"

setup_vim "${current_working_dir}"
setup_tmux "${current_working_dir}"

