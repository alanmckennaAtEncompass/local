# !/usr/bin/env bash

SCRIPT_DIR=`dirname -- "$0"`
SCRIPT_DIR=`cd "${SCRIPT_DIR}" && pwd`


function setup_tmux() {
  local_tmux_conf="${SCRIPT_DIR}/.tmux.conf"
  user_tmux_conf="${HOME}/tmux.conf"

  ln -sf ${local_tmux_conf} ${user_tmux_conf}
}

