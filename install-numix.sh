#!/usr/bin/env bash

sudo dnf copr enable -y numix/numix
sudo dnf install -y gnome-tweak-tool numix-\*
mkdir -p ~/.config/gtk-3.0/
# Makes the Numix header bars smaller.
ln -sf `pwd`/.config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css

# Popular Gnome Extensions that improve the environment
mkdir -p ~/.local/share/gnome-shell/extensions/
git clone https://github.com/voor/audio-output-switcher.git ~/.local/share/gnome-shell/extensions/audio-output-switcher@anduchs
git clone https://github.com/anduchs/audio-input-switcher.git ~/.local/share/gnome-shell/extensions/audio-input-switcher@anduchs
git clone https://github.com/v-dimitrov/gnome-shell-extension-stealmyfocus ~/.local/share/gnome-shell/extensions/focus-my-window@varianto25.com
git clone https://github.com/spin83/multi-monitors-add-on.git ~/.local/share/gnome-shell/extensions/multi-monitors-add-on@spin83
git clone https://github.com/phocean/TopIcons-plus ~/.local/share/gnome-shell/extensions/TopIcons@phocean.net
git clone https://github.com/deadalnix/pixel-saver.git ~/.local/share/gnome-shell/extensions/pixel-saver@deadalnix.me

printf "Manually configure gnome at this point.\n"
