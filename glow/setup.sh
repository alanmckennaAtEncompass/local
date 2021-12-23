# !/usr/bin/env bash

# version 1.4.1 works well

SCRIPT_DIR=`dirname -- "$0"`
SCRIPT_DIR=`cd "${SCRIPT_DIR}" && pwd`

function setup_glow() {
  local pkg_version pkg_name glow_home 
  pkg_version="$1"
  pkg_name="glow_${pkg_version}_linux_amd64.deb"
  glow_home="${SCRIPT_DIR}/.glow"

  mkdir "${glow_home}"

  wget "https://github.com/charmbracelet/glow/releases/download/v${pkg_version}/${pkg_name}" \
    -O "${glow_home}/${pkg_name}"

  sudo apt install "${glow_home}/${pkg_name}" || true

  rm -r "${glow_home}"
}


