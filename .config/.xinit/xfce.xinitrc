#!/bin/sh

if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" ]; then
	. "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile"
else
	. "$HOME/.xprofile"
fi


# Source
# [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
# [ -f ~/.xprofile ] && . ~/.xprofile

# Launch xfce
exec startxfce4
