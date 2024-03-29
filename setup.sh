#!/usr/bin/bash

PS3='Select A Setup : '
options=("Neovim Editor" "Fish Shell" "Zsh Shell" "Alacritty" "Exit")
select option in "${options[@]}"; do
	case $option in
	"Neovim Editor")
		./nvim.sh
		exit
		;;
	"Fish Shell")
		./fish.sh
		exit
		;;
	"Zsh Shell")
		./zsh.sh
		exit
		;;
	"Alacritty")
		./alacritty.sh
		exit
		;;
	"Exit")
		clear
		exit
		;;
	*)
		echo "invalid option $REPLY"
		exit
		;;
	esac
done
