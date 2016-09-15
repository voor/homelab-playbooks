#!/usr/bin/env bash

sudo dnf install -y fedora-repos-rawhide
# Right now this command has a problem of upgrading gnome-shell and various other libraries to unstable versions.
# Just do nodejs-1:6.3.1-1.fc25.x86_64 so we don't have issues with gnome-shell etc.
sudo dnf install -y --enablerepo=rawhide nodejs-1:6.3.1-1.fc25.x86_64 --best --allowerasing

# Activate the Atom COPR from mosquito
# https://copr.fedorainfracloud.org/coprs/mosquito/atom/
# sudo dnf copr enable -y mosquito/atom
# sudo dnf -y install atom
# Switched to using Atom's official RPM
curl -L -o atom.rpm https://atom.io/download/rpm
sudo dnf install -y atom.rpm && \
  rm -rf atom.rpm
# A bunch of packages I feel help enhance atom well.
apm install \
  asciidoc-preview \
  atom-beautify \
  atom-material-syntax \
  atom-material-syntax-light \
  atom-material-ui \
  atom-typescript \
  color-picker \
  docblockr \
  jumpy \
  language-asciidoc \
  language-docker \
  language-groovy \
  linter \
  linter-tslint \
  pigments \
  project-manager \
  sort-lines \
  split-diff
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
