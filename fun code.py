#!/usr/bin/env python3
from os import system
from time import sleep


def sp():
    sleep(0.8)


x = ""
while "exit" not in x:
    x = str(input("Type Your Command: "))
    xx = x
    if "ls" in xx:
        xx = "eza --icons"
    elif "la" in xx:
        xx = "eza --icons -a"
    elif "l" in xx:
        xx = "eza --icons -lrh"
    else:
        xx = x
    sp()
    system(xx)
