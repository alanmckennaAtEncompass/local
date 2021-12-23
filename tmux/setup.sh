# !/usr/bin/env bash

function setup_tmux() {
  local current_working_dir
  current_working_dir="$1"

  local_tmux_conf="${current_working_dir}/tmux/.tmux.conf"
  user_tmux_conf=~/.tmux.conf

  ln -sf ${local_tmux_conf} ${user_tmux_conf}
}

