#Path
# PATH="$PATH:/home/masud/.scripts"
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

#Defaults
export BROWSER="qutebrowser"
export EDITOR="nvim"
export TERMINAL="st"
export READER="zathura"
export FILE="nnn"

#xdg-home
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc


#Fix
export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.
export AWT_TOOLKIT="MToolkit wmname LG3D"	#May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm

#nnn environment
export NNN_USE_EDITOR=1
export NNN_OPENER=mimeopen
export NNN_COLORS="3246"
#export NNN_FCOLORS='0000c1ab003333f7330000'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_BMS='h:~/;d:~/Downloads;c:~/Downloads/Drive;n:~/Documents;p:~/Pictures;m:/home/masud/Music;w:~/Desktop;v:~/Videos;f:~/Videos/Movies;u:/run/media/masud'
export NNN_PLUG='d:drop;f:fzfcd;p:preview-tabbed;w:setbg;x:dups'

#tuir environment
export TUIR_BROWSER="elinks"
