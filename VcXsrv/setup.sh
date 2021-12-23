# !/usr/bin/env bash

function setup_VcXsrv() {
  local windows_username
  windows_username="$1"
  if [ -z "${windows_username}" ] 
  then
    available_users=`ls -I "Public" -I "All Users" -I "Default" -I "Default User" -I "desktop.ini" /mnt/c/Users/`
    echo "The available Windows users are listed below:"
    echo "${available_users}"
    read -p "What is your Windows username?: " windows_username
  fi
  
  wget https://netix.dl.sourceforge.net/project/vcxsrv/vcxsrv/1.20.9.0/vcxsrv-64.1.20.9.0.installer.exe \
    -O "/mnt/c/Users/${windows_username}/Downloads/vcxsrv-64.1.20.9.0.installer.exe"

  echo "The Windows install wizard for VcXsrv should now be installed in C://Users/${windows_username}/Downloads/vcxsrv-64.1.20.9.0.installer.exe. Please launch this in your local Windows environment to install VcXsrv. This will enable you to run GUI in WSL2"
}
