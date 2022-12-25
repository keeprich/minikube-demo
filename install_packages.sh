#!/bin/bash

    #AUTHER: Kenneth
    #DATE: 25-12-22
#................ INSTALLATION OF PACKAGES ........................

CURRENT_OS=$(hostnamectl | grep -i Operating | awk -F " " '{print $3}')
echo 'Checking the Operating system in use .....'
echo ${CURRENT_OS}


if [ ${CURRENT_OS} == Ubuntu ] 
then 
    echo 'success, You are using Ubuntu System' 
    sudo apt update -y
    #All packages that you want to install will go here
    
    ############################################ KUBECTL ###############################################
#UBUNTU -os

sudo apt-get update -y && sudo apt-get install -y apt-transport-https gnupg2

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update -y

sudo apt-get install -y kubectl

########################## Minikube ####################################

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

################################################ DOCKER ###################################

 sudo apt-get remove -y docker docker-engine docker.io containerd runc
 
 sudo apt-get update -y
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
    sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
  
  sudo apt-get update -y
  
  
  #If update failed the .......................
  #sudo chmod a+r /etc/apt/keyrings/docker.gpg
#sudo apt-get update

####### else next
  
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin


sudo docker run hello-world

    
elif [ ${CURRENT_OS} == CentOS ] 
then 
    echo 'Success, You are using CentOS system' 
    yum update -y
    #All packages that you want to install will go here
    
    
    ################### Install and enable Kubectl #########################################
#sudo yum install -y kubelet kubeadm kubectl

sudo yum install -y kubernetes-client
 


# systemctl enable kubelet

# systemctl start kubelet


################### Install and enable Minikube #########################################
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm


sudo rpm -Uvh minikube-latest.x86_64.rpm


################### Install and enable Docker #########################################
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine


sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo  


sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin                 

sudo systemctl start docker

sudo systemctl enable docker


else 
    echo 'hmmmm, You have to use either Ubuntu or CentOS for this script' 
fi

#Check for success message, if 0 the success
echo $?
echo 'script worked'
echo '########################### Minikube Version ############################################'
minikube version

echo '########################## Kebectl Version ##############################################'
kubectl version

echo '########################## Docker Vaersion ##############################################'
docker version | grep -i Version


