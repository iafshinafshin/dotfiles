#!/usr/bin/bash

PS3='Select Your System For Fish Shell Configs : '
options=("Ubuntu  >= 20" "Ferdora 󰣛" "Arch 󰣇 ( 😎 BTW 😎 )" "Debian " "Mac Os (🍺 🍻Home brew🍻 🍺)")
fish_dir=~/.config/fish

select option in "${options[@]}"; do
	case $option in
	"Ubuntu  >= 20")
		if [ ! -d "$fish_dir" ]; then
			sudo apt upadte -y
			sudo apt install fish -y
		else
			cp -rf ./.config/fish/config.fish
			cp -rf $fish_dir/
		fi
		echo "Fish Shell Configs successful"
		clear
		./setup.sh
		exit
		;;
	"Ferdora 󰣛")
		if [ ! -d "$fish_dir" ]; then
			sudo dnf upadte -y
			sudo dnf install fish -y
		else
			cp -rf ./.config/fish/config.fish
			cp -rf $fish_dir/
		fi
		clear
		./setup.sh
		exit
		;;
	"Arch 󰣇 ( 😎 BTW 😎 )")
		if [ ! -d "$fish_dir" ]; then
			sudo pacman -Sy -y
			sudo pacman -S fish -y
		else
			cp -rf ./.config/fish/config.fish
			cp -rf $fish_dir/
		fi
		clear
		./setup.sh
		exit
		;;
	"Debian ")
		if [ ! -d "$fish_dir" ]; then
			sudo apt-get update -y
			sudo apt-get install fish -y
		else
			cp -rf ./.config/fish/config.fish
			cp -rf $fish_dir/
		fi
		echo "Fish Shell Configs successful"
		clear
		./setup.sh
		exit
		;;
	"Mac Os (🍺 🍻Home brew🍻 🍺)")
		if [ ! -d "$fish_dir" ]; then
			brew install fish
		else
			cp -rf ./.config/fish/config.fish
			cp -rf $fish_dir/
		fi
		echo "Fish Shell Configs successful"
		clear
		./setup.sh
		exit
		;;
	*) echo "invalid option $REPLY" ;;
	esac
done
