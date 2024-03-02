#!/bin/env bash

echo "Upadte with pacman"

# sudo pacman -Sy

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "create my shortcuts in zsh "
echo 'alias ll="exa --icons -lrh -t=created"' >>.zshrc
echo 'alias la="exa --icons -lrh -a -t=created"' >>.zshrc
echo 'alias l="exa --icons"' >>.zshrc
echo 'alias nv="nvim"' >>.zshrc
echo 'alias cp="cp -rvf"' >>.zshrc
echo 'alias rm="rm -rvf"' >>.zshrc

echo "installing oh my zsh"

echo "install zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "write this code in plugin zsh : "
echo "zsh-syntax-highlighting"
echo "zsh-autosuggestions"
