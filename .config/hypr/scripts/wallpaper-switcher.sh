#!/bin/bash

# WALLPAPERS PATH
DIR=$HOME/Pictures

# Transition config (type swww img --help for more settings
FPS=60
TYPE="any"
# TYPE="simple"
DURATION=3

# wofi window config (in %)
WIDTH=20
HEIGHT=30

SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"

PICS=($(ls ${DIR} | grep -e ".jpg$" -e ".jpeg$" -e ".png$" -e ".gif$"))

RANDOM_PIC=${PICS[$RANDOM % ${#PICS[@]}]}
RANDOM_PIC_NAME="${#PICS[@]}. random"

# WOFI STYLES
# CONFIG="$HOME/.config/hypr/scripts/wofi/config"
# STYEL="$HOME/.config/hypr/scripts/wofi/style.css"
# COLORS="$HOME/.config/hypr/scripts/wofi/colors"
CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"
COLORS="$HOME/.config/wofi/colors.css"

# to check if swaybg is running

if [[ $(pidof swaybg) ]]; then
	pkill swaybg
fi

wofi_command="wofi --show dmenu \
			--prompt choose...
			--conf $CONFIG --style $STYLE --color $COLORS \
			--hide-scroll --no-actions \
			--matching=fuzzy"

menu() {
	# Here we are looping in the PICS array that is composed of all images in the $DIR
	# folder
	for i in ${!PICS[@]}; do
		# keeping the .gif to make sue you know it is animated
		if [[ -z $(echo ${PICS[$i]} | grep .gif$) ]]; then
			printf "$i. $(echo ${PICS[$i]} | cut -d. -f1)\n" # n°. <name_of_file_without_identifier>
		else
			printf "$i. ${PICS[$i]}\n"
		fi
	done

	printf "$RANDOM_PIC_NAME"
}

swww query || swww init

main() {
	choice=$(menu | ${wofi_command})

	# no choice case
	if [[ -z $choice ]]; then return; fi

	# random choice case
	if [ "$choice" = "$RANDOM_PIC_NAME" ]; then
		swww img ${DIR}/${RANDOM_PIC} $SWWW_PARAMS
		return
	fi
	pic_index=$(echo $choice | cut -d. -f1)

	current_wall=${DIR}/${PICS[$pic_index]}
	if [[ ! -f ~/Pictures/current_wallpaper.jpg ]]; then
		convert $current_wall ~/Pictures/current_wallpaper.jpg
	else
		rm -rf ~/Pictures/current_wallpaper.jpg
		convert $current_wall ~/Pictures/current_wallpaper.jpg
	fi
	rm -rf ~/.cache/wal/colors-kitty.conf
	rm -rf ~/.cache/wal/colors-alacritty.yml
	rm -rf ~/.cache/wal/colors--nodim-alacritty.yml

	swww img ~/Pictures/current_wallpaper.jpg $SWWW_PARAMS
	slipe 14
	wal -q -i ~/Pictures/current_wallpaper.jpg
	# slipe 10 | wal -q -i ~/Pictures/current_wallpaper.jpg
	# swww img ${DIR}/${PICS[$pic_index]} $SWWW_PARAMS
}

# Check if wofi is already running
if pidof wofi >/dev/null; then
	killall wofi
	exit 0
else
	main
fi

# Uncomment to launch something if a choice was made
# if [[ -n "$choice" ]]; then
# Restart Waybar
# fi
