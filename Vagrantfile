# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # all instances use Debian Wheezy 64 (there is no official 32bit in Atlas; is anybody still locked on 32bit?)
  config.vm.box = "debian/wheezy64"

  # all instances get 512MB, 1vcpu, caped at 50%
  # so we don't burn our cpu ;) just kidding,
  # but until the end we will have some instances and not all of us have 128GB; maybe 32GB?....
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
    vb.cpus = 1
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"] # change this, but I am 99.99% sure that this is applied to cheap vps boxes as well ;)
  end

  config.vm.define "master" do |master|
    master.vm.provision "puppet", manifests_path: "provision/master/manifests", module_path: "provision/master/modules"
  end

  config.vm.define "node1" do |node1|
    node1.vm.provision "puppet", manifests_path: "provision/nodes/manifests", module_path: "provision/nodes/modules"
  end

  ## this will make sure that all instances are updated and have puppet 3.x on any provisioning
  config.vm.provision "shell", path: "provision/init.sh"
end
