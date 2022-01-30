#!/bin/bash

#-----LOAD PROGRESS-----
if [ -e /home/dotfiles_install.progress ] ; then
  echo "Checking Dotfiles Install Progress..."
  apt_pkgs_installed=$(cat /home/dotfiles_install.progress | grep DOTFILES_APT_PKGS_INSTALLED | wc -l)
else
  echo "Initializing Dotfiles Install"
  apt_pkgs_installed=0
fi


#-----APT PACKAGES-----

if [ $apt_pkgs_installed -eq 0 ] ; then
  echo "Installing apt packages..."
  sudo apt install -y git sshpass

  #DOTFILES_APT_PKGS_INSTALLED=1
  if [ $? -eq 0 ] ; then
    echo "DOTFILES_APT_PKGS_INSTALLED" >> /home/dotfiles_install.progress
  else
    echo "Error loading apt packages"
  fi
else
  echo "Apt packages loaded"
fi



#-----APT PACKAGES-----
#-----APT PACKAGES-----
#-----APT PACKAGES-----
