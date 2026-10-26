#!/usr/bin/env bash

date_time=$(date '+%Y-%m-%d_%H-%M-%S')

mkdir -p ~/scrot

scrot -s ~/scrot/"$date_time".png

xclip -selection clipboard -t image/png \
    -i ~/scrot/"$date_time".png

