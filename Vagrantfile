# -*- mode: ruby -*-
# vi: set ft=ruby :

#-----------------------------------------------------------------------------------------------------------------#
# Author: Kenneth Dzonyrah
# Description: Vagrant file and script for provisioning Docker, kubectl, and Minikube
# Date: 03/22/2022
#------------------------------------------------------------------------------------------------------------------#

Vagrant.configure("2") do |config|
  # Define a VM named "minikube"
  config.vm.define "minikube" do |minikube|
    # Set the base box to CentOS 7
    minikube.vm.box = "centos/7"
    minikube.vm.hostname = "minikube"

    # Configure VirtualBox provider settings
    minikube.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--name", "minikube"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
    end

    # Provisioning script to allow password authentication for SSH
    config.vm.provision "shell", inline: <<-SHELL
      sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
      sudo systemctl restart sshd
    SHELL

    # Provisioning script for Jenkins installation (commented out)
    # Uncomment and provide the correct script path if needed
    # minikube.vm.provision "shell", path: "install_packages.sh"
  end
end
