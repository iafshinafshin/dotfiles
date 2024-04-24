#!/usr/bin/bash

PS3='Select A Setup : '
options=("Neovim Editor" "Fish Shell" "Zsh Shell" "Alacritty" "Exit")
select option in "${options[@]}"; do
	case $option in
	"Neovim Editor")
		clear
		./exec-file/nvim.sh
		exit
		;;
	"Fish Shell")
		clear
		./exec-file/fish.sh
		exit
		;;
	"Zsh Shell")
		clear
		./exec-file/zsh.sh
		exit
		;;
	"Alacritty")
		clear
		./exec-file/alacritty.sh
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
