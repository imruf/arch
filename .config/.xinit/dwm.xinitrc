#!/bin/sh

if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" ]; then
	. "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile"
else
	. "$HOME/.xprofile"
fi


# Activate dbus variables
dbus-update-activation-environment --all
dbus-launch ssh-agent dwm

# [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
# [ -f ~/.xprofile ] && . ~/.xprofile

# exec dwm

