# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "hypoalex/alpine"
  config.vm.provider "virtualbox"
  config.vm.network :private_network, ip: "172.168.65.2"
  config.vm.synced_folder ".", "/mininode", type: "nfs"

  config.vm.provision "shell", inline: <<-SHELL
    sudo apk update
    sudo apk upgrade
    sudo apk add alpine-sdk
    sudo apk add make
    sudo apk add gcc
    sudo apk add gperf
    sudo apk add vim
  SHELL
end
