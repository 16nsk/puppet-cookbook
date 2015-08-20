#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

if [ ! -f /root/.initial-provision ]
then

curl https://apt.puppetlabs.com/puppetlabs-release-wheezy.deb -o /tmp/puppetlabs-release-wheezy.deb
dpkg -i /tmp/puppetlabs-release-wheezy.deb

apt-get update
apt-get install -y puppet

fi
