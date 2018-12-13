#!/usr/bin/env bash

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf config-manager --set-enabled docker-ce-
sudo dnf install docker-ce

sudo systemctl enable --now docker

cat docker/docker-ip.sh >> ~/.zshrc

