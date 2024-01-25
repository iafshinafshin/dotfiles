#!/bin/env bash
sudo pacman -Sy
sudo pacman -Syu
sudo pacman -S neovim git thunar vim vi cmus base-devel 
echo "INSTALL PARU & YAY"
cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo git clone https://aur.archlinux.org/paru.git
cd yay 
makepkg -si
cd ..
cd paru 
makepkg -si

cd ~/

paru -S wofi mako thunar ttf-jetbrains-mono-nerd noto-fonts-emoji starship grim gvfs lxappearance

paru -s python2 node nodejs npm visual-studio-code-bin mpv zsh fish feh neovim alacritty exa 

echo "create my directorys"
mkdir ct
mkdir ft
mkdir Downloads 
mkdir Pictures


echo "INSTALL PACKER.NVIM"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "create my shortcuts in zsh "

echo 'alias ll="exa --icons -lrh -t=created"' >> .zshrc
echo 'alias la="exa --icons -lrh -a -t=created"' >>.zshrc
echo 'alias l="exa --icons"' >> .zshrc
echo 'alias nv="nvim"' >> .zshrc

echo "install snap store"

git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
sudo systemctl enable snapd
sudo ln -s /var/lib/snapd/snap /snap