#!/usr/bin/env bash

sudo dnf -y groupinstall gnome-desktop base-x -x PackageKit,PackageKit-command-not-found
sudo dnf install -y gnome-tweak-tool

# Popular Gnome Extensions that improve the environment
mkdir -p ~/.local/share/gnome-shell/extensions/
git clone https://github.com/voor/audio-output-switcher.git ~/.local/share/gnome-shell/extensions/audio-output-switcher@anduchs && \
  gnome-shell-extension-tool -e audio-output-switcher.git
git clone https://github.com/voor/audio-input-switcher.git ~/.local/share/gnome-shell/extensions/audio-input-switcher@anduchs && \
  gnome-shell-extension-tool -e audio-input-switcher.git
git clone https://github.com/tak0kada/gnome-shell-extension-stealmyfocus.git /tmp/gnome-shell-extension-stealmyfocus \
  && pushd /tmp/gnome-shell-extension-stealmyfocus \
  && make install \
  && popd \
  && rm -rf /tmp/gnome-shell-extension-stealmyfocus \
  && gnome-shell-extension-tool -e gnome-shell-extension-stealmyfocus
git clone https://github.com/spin83/multi-monitors-add-on.git /tmp/multi-monitors-add-on && \
  cp -r /tmp/multi-monitors-add-on/multi-monitors-add-on@spin83 ~/.local/share/gnome-shell/extensions && \
  rm -rf /tmp/multi-monitors-add-on && \
  gnome-shell-extension-tool -e multi-monitors-add-on@spin83
git clone https://github.com/phocean/TopIcons-plus /tmp/TopIcons-plus \
  && pushd /tmp/TopIcons-plus \
  && make install \
  && popd \
  && rm -rf /tmp/TopIcons-plus \
  && gnome-shell-extension-tool -e TopIcons@phocean.net
git clone https://github.com/deadalnix/pixel-saver.git /tmp/pixel-saver && \
  cp -r /tmp/pixel-saver/pixel-saver@deadalnix.me ~/.local/share/gnome-shell/extensions && \
  rm -rf /tmp/pixel-saver && \
  gnome-shell-extension-tool -e pixel-saver@deadalnix.me
