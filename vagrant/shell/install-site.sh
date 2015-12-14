#!/bin/bash

export DRUSH_PHP="/usr/bin/php"
export PATH=$PATH:~/bin

if [[ ! -d /vagrant/www ]]; then
    echo "Installing site ..."

    cd /vagrant
    phing build

    echo "Site installed."

else
   echo "Site already installed."
fi
