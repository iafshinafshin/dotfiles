#!/bin/env bash
cd
sudo pacman -Sy
sudo pacman -S neovim git thunar vim vi cmus base-devel zsh
echo "INSTALL PARU & YAY"
cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo git clone https://aur.archlinux.org/paru.git

sudo chown -R $USER:$USER yay paru

cd yay
makepkg -si
cd ..
cd paru
makepkg -si
mkaepkg -si

cd ~/

paru -S wofi mako thunar ttf-jetbrains-mono-nerd noto-fonts-emoji starship grim gvfs lxappearance

paru -s python2 node nodejs npm visual-studio-code-bin mpv zsh fish feh neovim alacritty eza

echo "create my directorys"
mkdir ct
mkdir ft
mkdir Downloads
mkdir Pictures

echo "create my shortcuts in zsh "

git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
sudo systemctl enable snapd
sudo ln -s /var/lib/snapd/snap /snap