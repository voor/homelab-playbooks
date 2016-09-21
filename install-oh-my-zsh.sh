#!/usr/bin/env bash

# http://ohmyz.sh/
sudo dnf install -y zsh git git-gui aspell-en meld

git config --global user.name "Robert Van Voorhees"
git config --global user.email rcvanvo@gmail.com
git config --global merge.tool meld
git config --global gpg.program gpg2
git config --global commit.gpgsign true
# Run this after you import keys.
# git config --global user.signingkey
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
printf '\n\n# Allows global NPM installs without sudo\nexport PATH=~/.npm-global/bin:$PATH\n' >> ~/.zshrc
