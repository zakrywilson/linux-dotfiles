#!/bin/bash

# author: Zach Wilson (zakrywilson@gmail.com)
#
# usage: dropbox.sh
#
# installs dropbox, if it does not exist
#
# source: https://www.dropbox.com/install-linux

set -e

if [[ $(which dropbox) ]]; then
  echo "dropbox already installed"
  exit 0
fi

DEB="dropbox.deb"
curl --silent --show-error \
  --location "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb" \
  --output "$DEB"
sudo apt install "./$DEB"
rm "$DEB"

echo "dropbox successfully installed"
