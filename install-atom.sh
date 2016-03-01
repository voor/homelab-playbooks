#!/usr/bin/env bash

# Activate the Atom COPR from Helber
# https://copr.fedorainfracloud.org/coprs/helber/atom/
sudo dnf copr enable -y helber/atom
sudo dnf -y install atom
# A bunch of packages I feel help enhance atom well.
apm install atom-beautify atom-material-syntax atom-material-syntax-light atom-material-ui sort-lines
