# -*- mode: ruby -*-
# vi: set ft=ruby :

# @Autor : Kenneth Dzonyrah
# Description : Vagrant file for provisionning Kubernetes
# Date : 03/22/2022
#   


Vagrant.configure("2") do |config|
    # load de centos7 box from vagrant cloud


    # jenkinshost-ken : is the name that have our server
  config.vm.define "minikube" do |kubernetes|
    kubernetes.vm.box = "centos/7"
    kubernetes.vm.hostname = "kubernetes"
    kubernetes.vm.network "private_network", ip: "192.168.56.160"

    kubernetes.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--name", "kubernetes"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
    end

    #change the value of the SSH configuration file, then restart the ssh service
    config.vm.provision "shell", inline: <<-SHELL
     sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
     sudo systemctl restart sshd
    SHELL

    #install_jenkinshost.sh : This is the script that will take care of the installation of Java, Jenkins server and some utilities
    config.vm.provision "shell", path: "install_packages.sh"
  end
end  
