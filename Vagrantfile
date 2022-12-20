# -*- mode: ruby -*-
# vi: set ft=ruby :

#-----------------------------------------------------------------------------------------------------------------#
#
# @Autor : Kenneth Dzonyrah
# Description : Vagrant file and script for provisionning docker, kubectl and minikube    
# Date : 03/22/2022
#
#------------------------------------------------------------------------------------------------------------------#

Vagrant.configure("2") do |config|
    # jenkinshost : is the name that have our server
    config.vm.define "minikube" do |minikube|
      minikube.vm.box = "centos/7"
      minikube.vm.hostname = "minikube"
      minikube.vm.network "private_network", ip: "192.168.56.173"
      #jenkinshost.vm.box_url = "utrains/centos7"
      minikube.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--name", "minikube"]
        v.customize ["modifyvm", :id, "--cpus", "2"]
      end
      config.vm.provision "shell", inline: <<-SHELL
        sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
        sudo systemctl restart sshd
      SHELL
      #install_jenkinshost.sh : This is the script that will take care of the installation of Java, Jenkins server and some utilities
      minikube.vm.provision "shell", path: "install_pack.sh"
    end
  end
