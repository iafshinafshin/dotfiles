#!/bin/bash

VIDEO_ID=$1
RESOLUTION=$2

if [[ $VIDEO_ID == --help ]]; then
	echo -e "\e[4mIn first argument is youtube video id 
In second argument is resolution"
	exit
fi
[ -z "$VIDEO_ID" ] && echo -e "\e[7mERROR: no video ID specified 
you can use for self help in first argument --help " && exit 1

if [[ -z "$RESOLUTION" ]]; then
	echo "$RESOLUTION"
	RESOLUTION=720
fi

proxychains yt-dlp "https://www.youtube.com/watch?v=$VIDEO_ID" --format mp4 -S res:$RESOLUTION
