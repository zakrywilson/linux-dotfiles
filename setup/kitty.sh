#!/bin/bash

# author: Zach Wilson (zakrywilson@gmail.com)
#
# usage: kitty.sh
#
# installs kitty, if it does not exist
#
# source: https://sw.kovidgoyal.net/kitty/binary/

set -e

if [[ $(which kitty) ]]; then
  echo "kitty already installed"
  exit 0
fi

curl --silent --show-error \
  --location https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n

echo "kitty successfully installed"

