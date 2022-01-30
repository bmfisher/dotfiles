#!/bin/bash

#-----LOAD PROGRESS-----------
if [ -e ~/dotfiles_install.progress ] ; then
  echo "Checking Dotfiles Install Progress..."
  apt_pkgs_installed=$(cat ~/dotfiles_install.progress | grep DOTFILES_APT_PKGS_INSTALLED | wc -l)
  ssh_key_ready=$(cat ~/dotfiles_install.progress | grep DOTFILES_SSH_KEY_READY | wc -l)
  dotfiles_cloned=$(cat ~/dotfiles_install.progress | grep DOTFILES_CLONED | wc -l)
else
  echo "Initializing Dotfiles Install"
  apt_pkgs_installed=0
  ssh_key_ready=0
  dotfiles_cloned=0
fi
#-----------------------------

#-----SETUP SSH KEY-----------
if [ $ssh_key_ready -eq 0 ] ; then
  read -p "SSH Key Email: " ssh_email
  ssh-keygen -t ed25519 -C $ssh_email
  eval "$(ssh-agent -s)"
  ssh-add /home/brandon/.ssh/id_ed25519
  if [ $? -eq 0 ] ; then
    echo "DOTFILES_SSH_KEY_READY" >> ~/dotfiles_install.progress
  else
    echo "Error adding ssh key to ssh-agent"
  fi
  cat ~/.ssh/id_ed25519.pub | /mnt/c/Windows/System32/clip.exe
  echo "SSH Key Ready. id_ed25519.pub copied to clipboard"
fi
#-----------------------------

#-----APT PACKAGES------------
if [ $apt_pkgs_installed -eq 0 ] ; then
  echo "Installing apt packages..."
  sudo apt install -y git sshpass

  #DOTFILES_APT_PKGS_INSTALLED=1
  if [ $? -eq 0 ] ; then
    echo "DOTFILES_APT_PKGS_INSTALLED" >> ~/dotfiles_install.progress
  else
    echo "Error loading apt packages"
  fi
else
  echo "Apt packages loaded"
fi
#-----------------------------

#-----GIT SETUP / SSH---------
if [ $apt_pkgs_installed -eq 0 ] ; then
  echo "Cloning dotfiles"
  git clone git@github.com:bmfisher/dotfiles.git
  echo "DOTFILES_CLONED" >> ~/dotfiles_install.progress
else
  echo "Dotfiles already cloned"
fi

#-----------------------------


#-----APT PACKAGES-----
#-----APT PACKAGES-----
