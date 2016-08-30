#!/usr/bin/env bash

sudo dnf install -y fedora-repos-rawhide
sudo dnf install -y --enablerepo rawhide nodejs libuv --best --allowerasing

# Activate the Atom COPR from Helber
# https://copr.fedorainfracloud.org/coprs/helber/atom/
# sudo dnf copr enable -y helber/atom
# sudo dnf -y install atom npm
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
  pigments
  project-manager \
  sort-lines \
  split-diff
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
