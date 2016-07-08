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

php composer.phar config github-oauth.github.com 477588d76688dc531ad60c9edcf31b6b8168e561

php composer.phar --ansi --no-progress --no-interaction --verbose install
