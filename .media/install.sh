#!/usr/bin/env sh

tar -xvf configuration.tar.gz
cp configuration/* ~
sudo dnf install -y nginx
sudo cp couchpotatoserver.service mylar.service sabnzbd.service sickrage.service  /etc/systemd/system/
sudo cp media.conf /etc/nginx/conf.d/
