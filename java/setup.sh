# !/usr/bin/env bash

function setup_java() {
  sdk version
  RESULT=$?
  if [ $RESULT -ne 0 ]; then
    source "../sdkman/setup.sh"
    setup_sdkman
  fi

  sdk install java 8.0.302-open
}
