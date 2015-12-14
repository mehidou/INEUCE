#!/bin/bash

echo "Installing composer ..."

cd /vagrant

if [ ! -e "composer.phar" ]; then
    curl -sS https://getcomposer.org/installer | php
fi

# if composer.phar is over 30 days old
if test "`find composer.phar -mtime +30`"; then
    php composer.phar --ansi self-update
fi

php composer.phar --ansi install
