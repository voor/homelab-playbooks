#!/usr/bin/env bash

# More recent version will replace the one distributed with Fedora.
sudo dnf install -y docker-engine
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker `whoami`
sudo -c 'curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose'
sudo chmod +x /usr/local/bin/docker-compose

cat docker/docker-ip.sh >> ~/.zshrc
