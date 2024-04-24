#!/usr/bin/bash

PS3='Select your option : '
options=("Copy My Alacritty Themes" "Many Alacritty Theme" "Hello")
alacritty_path=~/.config/alacritty
alacritty_themes=https://github.com/alacritty/alacritty-theme.git

if [ ! -d "$alacritty_path" ]; then
	mkdir -p $alacritty_path
else
	mv $alacritty_path{,.bak}
fi
alacritty_dotfile_path=$(pwd)/.config/alacritty
select option in "${options[@]}"; do
	case $option in
	"Alacritty setup themes(Solarized dark(iterm2) | Solarized dark | Everforest)")
		clear
		cp -rf $alacritty_dotfile_path $alacritty_path
		sleep 0.5
		echo "Alacritty setup successful"
		sleep 2
		clear
		./setup.sh
		exit
		;;
	"Many Alacritty Theme")
		clear
		git clone $alacritty_themes
		sleep 0.5
		echo "Alacritty setup themes successful"
		sleep 2
		clear
		./setup.sh
		exit
		;;
	"Hello")
		echo "Hello"
		sleep 2
		clear
		./setup.sh
		exit
		;;
	*) echo "invalid option $REPLY" ;;
	esac
done
