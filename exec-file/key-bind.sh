#!/usr/bin/bash

PS3='Select your: '
options=("Install With Make Package")
clear

select option in "${options[@]}"; do
	case $option in
	"Install With Make Package")
		if [[ ! /usr/bin/make ]]; then
			clear
			echo -e "\e[7mYou need cmake or make command, if you have not it, you should install it on your system"
			exit
		fi
		git clone https://github.com/rvaiya/keyd
		cd keyd
		echo "Request root premission Because config in the etc Directory"
		make && sudo make install
		sudo systemctl enable keyd && sudo systemctl start keyd
		echo "Request root premission Because config's in the etc Directory"
		sudo rm -rf /etc/keyd/default.conf
		sudo cp -rf ./keyd/default.conf
		cp -rf ./.config/keyd/default.conf /etc/
		clear
		echo "Shortcuts in your system have been installed"
		exit
		;;
	*) echo "Invalid Option $REPLY" ;;
	esac
done
