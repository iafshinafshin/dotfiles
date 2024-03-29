#!/usr/bin/bash

PS3='Select an option : '
options=("Neovim Lazyvim" "Neovim Packer")
neovim=~/.config/nvim

select option in "${options[@]}"; do
	case $option in
	"Neovim Lazyvim")
		if [ ! -d "$neovim" ]; then
			cp -rf $(pwd)/.config/nvim $neovim
		else
			mv ~/.config/nvim{,.bak}
			if [ -d "~/.local/share/nvim.bak"]; then
			else
				mv ~/.local/share/nvim{,.bak}
			fi
			if [ -d "~/.cache/nvim.bak"]; then
			else
				mv ~/.cache/nvim{,.bak}
			fi
			if [ -d "~/.local/state/nvim.bak"]; then
			else
				mv ~/.local/state/nvim{,.bak}
			fi
		fi
		exit
		;;
	"Neovim Packer")
		if [ ! -d "$neovim" ]; then
			cp -rf $(pwd)/.config/nvim/nvim-packer $neovim
		else
			mv ~/.config/nvim{,.bak}
			if [ -d "~/.local/share/nvim.bak"]; then
			else
				mv ~/.local/share/nvim{,.bak}
			fi
			if [ -d "~/.cache/nvim.bak"]; then
			else
				mv ~/.cache/nvim{,.bak}
			fi
			if [ -d "~/.local/state/nvim.bak"]; then
			else
				mv ~/.local/state/nvim{,.bak}
			fi
			if [ -d "~/.local/share/nvim"]; then
				git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
			else
				mv ~/.local/share/nvim{,.bak}
			fi
		fi
		exit
		;;
	*) echo "Invalid option $REPLY" ;;
	esac
done
