#!/usr/bin/env bash

sudo dnf install -y fedora-repos-rawhide nodejs jq

sudo dnf install -y `curl -s https://api.github.com/repos/atom/atom/releases/latest | jq --raw-output -c '.assets[] | select(.name | contains("atom.x86_64.rpm")) | .browser_download_url'`

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
