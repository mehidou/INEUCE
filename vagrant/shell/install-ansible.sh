#!/bin/sh

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install ansible python-mysqldb --assume-yes

sudo PYTHONUNBUFFERED=1 ansible-playbook /vagrant/vagrant/ansible/dev.yml \
     --inventory-file=/vagrant/vagrant/ansible/hosts \
     --diff \
     --connection=local
