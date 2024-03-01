#!/data/data/com.termux/files/usr/bin/bash

PS3='Select your colorscheme: '
colorschemes=("gruvbox dark" "solarized dark" "tokyonight night" "tokyonight storm" "tokyonight day" "rose pine")

select option in "${colorschemes[@]}"; do
	case $option in
	"gruvbox dark")
		cp colorschemes/gruvbox_dark.properties ~/.termux/colors.properties
		termux-reload-settings
		exit
		;;
	"tokyonight night")
		cp colorschemes/tokyonight-night.properties ~/.termux/colors.properties
		termux-reload-settings
		exit
		;;
	"tokyonight storm")
		cp colorschemes/tokyonight-storm.properties ~/.termux/colors.properties
		termux-reload-settings
		exit
		;;
	"tokyonight day")
		cp colorschemes/tokyonight-day.properties ~/.termux/colors.properties
		termux-reload-settings
		exit
		;;
	"solarized dark")
		cp colorschemes/solarized-dark.properties ~/.termux/colors.properties
		termux-reload-settings
		exit
		;;
	"rose pine")
		cp colorschemes/rose-pine.properties ~/.termux/colors.properties
		termux-reload-settings
		exit
		;;
	*) echo "invalid option $REPLY" ;;
	esac
done
