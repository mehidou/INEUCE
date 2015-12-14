#!/bin/bash

if [[ ! -f /usr/bin/puppet ]]; then
    echo "Installing Puppet ..."

    apt-get update  --quiet --assume-yes
    # apt-get dist-upgrade --quiet --assume-yes

    apt-get --quiet --assume-yes install puppet

    PUPPET_VERSION=$(puppet help | grep 'Puppet v')
    echo "Finished installing puppet to latest version: $PUPPET_VERSION."

    echo "Installing Puppet modules ..."
    puppet module install puppetlabs/apt
    puppet module install puppetlabs/apache
    puppet module install puppetlabs/mysql --version 3.5.0
    puppet module install example42/php
    puppet module install example42/solr

else
    echo "Puppet already installed."
fi
