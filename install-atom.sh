#!/usr/bin/env bash

sudo dnf install -y fedora-repos-rawhide nodejs jq

# A bunch of packages I feel help enhance atom well.
apm install \
  asciidoc-preview \
  atom-beautify \
  autocomplete-js-import \
  busy-signal \
  color-picker \
  docblockr \
  fonts \
  intentions \
  jumpy \
  language-asciidoc \
  language-babel \
  language-docker \
  language-groovy \
  language-kickstart \
  language-protobuf \
  language-rpm-spec \
  linter \
  linter-eslint \
  linter-ui-default \
  pigments \
  project-manager \
  react-es6-snippets \
  react-redux-snippets \
  sort-lines \
  split-diff

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
