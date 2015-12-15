#!/bin/sh

# On GNU/Linux Debian 8 (Jessie), Ansible version 1.7.2 is available
# but we want to install the latest version so that we can take
# advantage of new features. We use pip (Phyton package manager) to
# install ansible instead of apt-get.

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install python-pip python-dev --assume-yes
sudo https_proxy=$2 pip install ansible

sudo PYTHONUNBUFFERED=1 ansible-playbook /vagrant/vagrant/ansible/dev.yml \
     --inventory-file=/vagrant/vagrant/ansible/hosts \
     --connection=local
