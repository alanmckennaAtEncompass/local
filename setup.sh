# !/usr/bin/env bash

apt install wget

SCRIPT_DIR=`dirname -- "$0"`
SCRIPT_DIR=`cd "${SCRIPT_DIR}" && pwd`

# source all 'setup.sh' scripts in subtree
find "$(pwd)" -name setup.sh -print0 |
  while IFS= read -r -d '' line; do
    source "$line"
  done

# setup_vim 
# setup_tmux
# setup_git
# setup_dsf "1.4.2" 
# setup_glow "1.4.1"
# setup_sdkman
# setup_java
# setup_maven
# setup_wkhtmltopdf
# setup_intellij
# setup_nvm
# setup_VcXsrv
