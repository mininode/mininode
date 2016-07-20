# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    hostname = "mininode.box"
    config.vm.box = "debian/contrib-jessie64"
    
    config.vm.provider "virtualbox" do |v|
      v.memory = 256
      v.cpus = 1
    end

    config.vm.synced_folder ".", "/src"
    
    # Setup
    config.vm.provision :shell, :inline => "apt-get update --fix-missing"
    config.vm.provision :shell, :inline => "apt-get -y dist-upgrade"
    config.vm.provision :shell, :inline => "apt-get install -q -y build-essential g++ make git gperf curl vim"

end