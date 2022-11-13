#!/bin/bash

# author: Zach Wilson (zakrywilson@gmail.com)
#
# usage: 1password.sh
#
# description: installs 1password, if it does not exist
#
# source: https://support.1password.com/install-linux/?utm_source=google&utm_medium=cpc&utm_campaign=18388341772&utm_content=&utm_term=&gclsrc=ds#debian-or-ubuntu

set -e

if [[ $(which 1password) ]]; then
  echo "1password already installed"
  exit 0
fi

# 1. Add the key for the 1Password apt repository:
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg

# 2. Add the 1Password apt repository:
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list

# 3. Add the debsig-verify policy:
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

# 4. Install 1Password:
sudo apt update && sudo apt install 1password

echo "1password successfully installed"
