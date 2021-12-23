# !/usr/bin/env bash

function setup_nvm() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  nvm install v9.9.0
  nvm alias default v9.9.0
}

