#!/bin/bash

cat /vagrant/vagrant/shell/self-promotion.txt

#echo "Fixing bug 'stdin: is not a tty'"
# see https://github.com/mitchellh/vagrant/issues/1673
#sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

cd /vagrant

if [ ! -e "build.properties" ]; then
    touch build.properties
    echo "You may have to fill build.properties to override build.default.properties."
fi
