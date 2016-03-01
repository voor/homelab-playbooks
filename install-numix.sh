#!/usr/bin/env bash

sudo dnf copr enable -y numix/numix
sudo dnf install -y numix-\*
mkdir -p ~/.config/gtk-3.0/
# Makes the Numix header bars smaller.
ln -sf .config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css
