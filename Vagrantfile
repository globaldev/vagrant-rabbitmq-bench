# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "centos1" do |config|
    config.vm.box = "centos-5.6"
    config.vm.box_url = "http://dl.dropbox.com/u/9227672/centos-5.6-x86_64-netinstall-4.1.6.box"
    config.vm.provision "shell", path: "centos.sh"
    config.vm.network :private_network, ip: "192.168.56.201"
    config.vm.hostname = "rabbit1"
  end

  config.vm.define "centos2" do |config|
    config.vm.box = "centos-5.6"
    config.vm.box_url = "http://dl.dropbox.com/u/9227672/centos-5.6-x86_64-netinstall-4.1.6.box"
    config.vm.provision "shell", path: "centos.sh"
    config.vm.network :private_network, ip: "192.168.56.202"
    config.vm.hostname = "rabbit2"
  end

  config.vm.define "ubuntu1" do |config|
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    config.vm.provision "shell", path: "ubuntu.sh"
    config.vm.network :private_network, ip: "192.168.56.211"
    config.vm.hostname = "rabbit1"
  end

  config.vm.define "ubuntu2" do |config|
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    config.vm.provision "shell", path: "ubuntu.sh"
    config.vm.network :private_network, ip: "192.168.56.212"
    config.vm.hostname = "rabbit2"
  end
end
