#!/bin/zsh

# Path
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':' -)"

# Defaults
export BROWSER="qutebrowser"
export EDITOR="nvim"
export TERMINAL="st"
export READER="zathura"
export FILE="nnn"

# ManPage
# export MANPAGER="nvim -c 'set ft=man' -"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

# xdg-dir
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"

export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"

export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export MOST_INITFILE="$XDG_CONFIG_HOME"/most/mostrc

# Fzf
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

# Askpass
export SUDO_ASKPASS="$HOME/.local/bin/scripts/dmenupass"

# Fix
# export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.
export AWT_TOOLKIT="MToolkit wmname LG3D"	#May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm

# nnn environment
export NNN_USE_EDITOR=1
export NNN_OPTS="aCdDr"
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_OPENER=mimeopen
export NNN_COLORS="3427"
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_BMS='h:~/;d:~/Downloads;n:~/Documents;p:~/Pictures;m:/home/masud/Music;w:~/Desktop;v:~/Videos;f:~/Videos/Movies;u:/run/media/masud'
export NNN_PLUG='d:dragdrop;f:fzfcd;p:preview-tui-ext;w:setbg;x:dups'

# tuir environment
export TUIR_BROWSER="elinks"
