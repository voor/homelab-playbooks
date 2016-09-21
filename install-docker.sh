#!/usr/bin/env bash

# Use the stable version provided by Fedora.
sudo dnf install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker `whoami`
# sudo -c 'curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose'
# sudo chmod +x /usr/local/bin/docker-compose

cat docker/docker-ip.sh >> ~/.zshrc

# curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.9.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
# curl -Lo kubectl http://storage.googleapis.com/kubernetes-release/release/v1.3.7/bin/linux/amd64/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/
sudo dnf install -y kubernetes etcd
sudo systemctl enable --now etcd kube-apiserver kube-controller-manager kube-scheduler kubelet docker kube-proxy
