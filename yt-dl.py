#!/bin/python3
from os import system
from time import sleep

download_list = []
inp = str(input("Enter your video youtube id : "))
download_list.append(inp)
show_count_list = f"your count of your download list is {len(download_list)}"
while "q" not in inp:
    inp = str(input("Enter your video youtube id : "))
    if "q" in inp:
        print(show_count_list)
        break
    else:
        download_list.append(inp)

for i in download_list:
    system(f"./youtube_downloader.sh {i}")
    system("clear")
    sleep(3)
    system(f"echo -e '\e[1m {show_count_list} and you in {download_list.index(i)+1}'")
