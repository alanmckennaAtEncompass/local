# !/usr/bin/env bash

SCRIPT_DIR=`dirname -- "$0"`
SCRIPT_DIR=`cd "${SCRIPT_DIR}" && pwd`

function setup_intellij() {
  wget https://download-cdn.jetbrains.com/idea/ideaIU-2021.3.tar.gz \
    -O "${SCRIPT_DIR}/ideaIU-2021.3.tar.gz"

  tar --version
  RESULT=$?
  if [ $RESULT -ne 0 ]; then
    apt install tar 
  fi

  tar -xf "${SCRIPT_DIR}/ideaIU-2021.3.tar.gz"
  
  sudo ln -s "${SCRIPT_DIR}/idea-IU-213.5744.223/bin/idea /usr/local/bin/idea
}
