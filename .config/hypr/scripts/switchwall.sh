#!/usr/bin/env bash

if [ "$1" == "--noswitch" ]; then
	current_wall=$(swww query | awk -F 'image: ' '{print $2}')
else
	# Select and set image (hyprland)
	cd "$HOME/Pictures"
	current_wall=$(yad --width 1000 --height 800 --file --title='Choose wallpaper')
	screensizey=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2 | head -1)
	cursorposx=$(hyprctl cursorpos -j | gojq '.x' 2>/dev/null) || cursorposx=960
	cursorposy=$(hyprctl cursorpos -j | gojq '.y' 2>/dev/null) || cursorposy=540
	cursorposy_inverted=$((screensizey - cursorposy))
	if [[ ! -f ~/Pictures/current_wallpaper.jpg ]]; then
		convert $current_wall ~/Pictures/current_wallpaper.jpg
	else
		rm -rf ~/Pictures/current_wallpaper.jpg
		convert $current_wall ~/Pictures/current_wallpaper.jpg
	fi
	if [ "$current_wall" == '' ]; then
		echo 'Aborted'
		exit 0
	fi
	slipe 14
	wal -q -i ~/Pictures/current_wallpaper.jpg

	swww img ~/Pictures/current_wallpaper.jpg --transition-step 100 --transition-fps 60 \
		--transition-type grow --transition-angle 60 --transition-duration 3 \
		--transition-pos "$cursorposx, $cursorposy_inverted"
fi
