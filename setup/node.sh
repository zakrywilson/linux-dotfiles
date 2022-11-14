#!/bin/bash

# author: Zach Wilson (zakrywilson@gmail.com)
#
# usage: node.sh
#
# installs nvm and node, if they do not exist... I wish for a better life

set -e

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

nvm install node
