#!/bin/sh

url=$(echo $1 | sed 's/intent/https/')
export DISPLAY=:0;
nohup mpv &
