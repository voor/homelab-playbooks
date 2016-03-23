#!/usr/bin/env bash

# Activate the Atom COPR from Helber
# https://copr.fedorainfracloud.org/coprs/helber/atom/
sudo dnf copr enable -y helber/atom
sudo dnf -y install atom npm
# A bunch of packages I feel help enhance atom well.
apm install atom-beautify atom-material-syntax atom-material-syntax-light atom-material-ui sort-lines language-asciidoc
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
