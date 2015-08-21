#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

# we check if we already did the init
if [ ! -f /root/.initial-provision ]
then

  curl https://apt.puppetlabs.com/puppetlabs-release-wheezy.deb -o /tmp/puppetlabs-release-wheezy.deb
  dpkg -i /tmp/puppetlabs-release-wheezy.deb

fi

# we always do upgrade on provision
apt-get update
apt-get upgrade -y

# on first init we install puppet
if [ ! -f /root/.initial-provision ]
  then
  apt-get install -y puppet
  touch /root/.initial-provision

fi
