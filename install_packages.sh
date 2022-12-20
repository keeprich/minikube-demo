sudo yum update -y

#sudo yum install -y kubelet kubeadm kubectl







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
