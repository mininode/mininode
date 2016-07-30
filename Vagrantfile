# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "hypoalex/alpine34"
  config.ssh.shell = "/bin/sh"
  config.vm.network :private_network, ip: "172.168.65.2"
  config.vm.synced_folder ".", "/src", type: "nfs"

  config.vm.provision "shell", inline: <<-SHELL
    sudo apk add alpine-sdk
    sudo apk add gperf
    sudo apk add vim
  SHELL
end
