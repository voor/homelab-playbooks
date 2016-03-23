#!/usr/bin/env bash

# http://ohmyz.sh/
sudo dnf install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
printf '\n\n# Allows global NPM installs without sudo\nexport PATH=~/.npm-global/bin:$PATH\n' >> ~/.zshrc
