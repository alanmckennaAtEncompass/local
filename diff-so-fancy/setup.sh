# !/usr/bin/env bash

SCRIPT_DIR=`dirname -- "$0"`
SCRIPT_DIR=`cd "${SCRIPT_DIR}" && pwd`

function setup_dsf() {
  local dfs_version dfs_binary
  dfs_version="$1"

  dfs_binary="${SCRIPT_DIR}/diff-so-fancy/diff-so-fancy"

  wget "https://github.com/so-fancy/diff-so-fancy/releases/download/v${dfs_version}/diff-so-fancy" \
    -O "${dfs_binary}"

  chmod 777 "${dfs_binary}"
  PATH=$PATH:"${SCRIPT_DIR}"/diff-so-fancy
  
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
  git config --global interactive.diffFilter "diff-so-fancy --patch"

  git config --global color.ui true

  git config --global color.diff-highlight.oldNormal    "red bold"
  git config --global color.diff-highlight.oldHighlight "red bold 52"
  git config --global color.diff-highlight.newNormal    "green bold"
  git config --global color.diff-highlight.newHighlight "green bold 22"

  git config --global color.diff.meta       "11"
  git config --global color.diff.frag       "magenta bold"
  git config --global color.diff.func       "146 bold"
  git config --global color.diff.commit     "yellow bold"
  git config --global color.diff.old        "red bold"
  git config --global color.diff.new        "green bold"
  git config --global color.diff.whitespace "red reverse"

}

