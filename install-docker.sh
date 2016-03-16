#!/usr/bin/env bash

sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/fedora/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

# More recent version will replace the one distributed with Fedora.
sudo dnf install docker-engine
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker `whoami`
# This will install of the dependencies, but it's usually outdated
sudo dnf install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
