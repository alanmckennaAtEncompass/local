# !/usr/bin/env bash

SCRIPT_DIR=`dirname -- "$0"`
SCRIPT_DIR=`cd "${SCRIPT_DIR}" && pwd`

# source all 'setup.sh' scripts in subtree
find "$(pwd)" -name setup.sh -print0 |
  while IFS= read -r -d '' line; do
    source "$line"
  done

function setup_vim() {
  local current_working_dir
  current_working_dir="$1"

  local_vimrc="${current_working_dir}/vim/.vimrc"
  user_vimrc=~/.vimrc

  echo "source ${local_vimrc}" > ${user_vimrc}
  
  mkdir -p ~/.config/nvim
  echo "source ${local_vimrc}" > ~/.config/nvim/init.vim
  
  vim -es -u ${user_vimrc} -i NONE -c "PlugInstall" -c "qa"
}


# setup_vim "${SCRIPT_DIR}"
# setup_tmux "${SCRIPT_DIR}"
# setup_git
# setup_dsf "1.4.2" 
# setup_glow "1.4.1"
# setup_sdkman
# setup_java
# setup_maven
# setup_wkhtmltopdf
# setup_intellij
