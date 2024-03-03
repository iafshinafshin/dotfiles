#!/bin/bash

DIR=$HOME/Pictures/
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

if [[ $(pidof swaybg) ]]; then
	pkill swaybg
fi

current_wall=${DIR}/${RANDOMPICS}

if [[ ! -f ~/Pictures/current_wallpaper.jpg ]]; then
	convert $current_wall ~/Pictures/current_wallpaper.jpg
else
	rm -rf ~/Pictures/current_wallpaper.jpg
	convert $current_wall ~/Pictures/current_wallpaper.jpg
fi
swww query || swww init
#change-wallpaper using swww
rm -rf ~/.cache/wal/colors-kitty.conf
rm -rf ~/.cache/wal/colors-alacritty.yml
rm -rf ~/.cache/wal/colors--nodim-alacritty.yml
swww img $current_wall --transition-fps 60 --transition-type any --transition-duration 3
slipe 14
wal -q -i ~/Pictures/current_wallpaper.jpg
