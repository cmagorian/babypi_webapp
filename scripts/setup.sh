#!/bin/bash

set -euo pipefail

# validate root permissions
if [[ $EUID -ne 0 ]]; then
   printf "This script must be run as root \n"
   exit 1
fi

echo "#############################"
echo "## Update / Upgrade repos ###"
echo "#############################"

apt-get update \
  && apt-get dist-upgrade

echo "#############################"
echo "## Setting up BabyPi deps ###"
echo "#############################"

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt-get install -y nodejs

echo "#############################"
echo "## Checking deps installed ##"
echo "#############################"

node -v