#!/usr/bin/env bash

sudo dnf install -y nodejs jq

code --install-extension anseki.vscode-color
code --install-extension bungcip.better-toml
code --install-extension coolbear.systemd-unit-file
code --install-extension esbenp.prettier-vscode
code --install-extension mauve.terraform
code --install-extension PeterJausovec.vscode-docker
code --install-extension robinbentley.sass-indented
code --install-extension samuelcolvin.jinjahtml

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
