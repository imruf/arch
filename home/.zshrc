#EXPORT 
export TERM="xterm-256color"
export TERM="st-256color"
export ZSH="/home/masud/.oh-my-zsh"
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=dbus
export QT_IM_MODULE=ibus


#PLUGINS
plugins=(git extract zsh-autosuggestions zsh-syntax-highlighting zsh-completions vi-mode)

#SOURCE
source $ZSH/oh-my-zsh.sh
#source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
source /home/masud/powerlevel10k/powerlevel10k.zsh-theme

#Theme
ZSH_THEME=powerlevel10k/powerlevel10k

#LIST
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias lah='ls -lah --color=auto'
alias l='ls' 					
alias l.="ls -A | egrep '^\.'"      

#TYPO
alias cd..='cd ..'
alias pdw="pwd"

#GREP
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#FREE
alias free="free -mt"

#USERLIST
alias userlist="cut -d: -f1 /etc/passwd"

#MERGE
alias merge="xrdb -merge ~/.Xresources"

#OUTPUT
alias df='df -h'

#CONKY
alias kc='killall conky'

#HARDWARE
alias hw="hwinfo --short"

#MICROCODE
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#GRUB
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#DATABASE
alias updb='sudo updatedb'

#FONTS
alias fc='sudo fc-cache -fv'

#WGET
alias wget="wget -c"

#MIRROR
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias mirrorb="sudo reflector -f 10 --country Bangladesh --save /etc/pacman.d/mirrorlist"

#PACMAN
alias pac='sudo pacman --color auto'
alias update='sudo pacman -Syyu'
alias up='sudo pacman -Syu'
alias pacs='pacman -Ss'
alias inp='sudo pacman -S'
alias rmv='sudo pacman -Rns'

alias unlock="sudo rm /var/lib/pacman/db.lck"
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias cc='sudo pacman -Sc'
alias nrp='pacman -Qdt'
alias lfp='pacman -Qqm'
alias fp='pacman -Qm'
alias efp='pacman -Qqe'

alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -100"

#AUR
alias inpkg='makepkg -si'
#alias upaur="yay -Syu"
#yay
alias yinp='yay -S'
alias yayskip='yay -S --mflags --skipinteg'
alias upyay="yay -Syu --noconfirm"
#trizen
alias tinp='trizen -S'
alias uptrizen="trizen -Syu --noconfirm"
alias trizenskip='trizen -S --skipinteg'

#MOUNT
alias mount='udisksctl mount -b'
alias files='udisksctl mount -b /dev/sda4'
alias ufiles='udisksctl unmount -b /dev/sda4'
alias os='udisksctl mount -b /dev/sda2'
alias uos='udisksctl unmount -b /dev/sda2'
alias usb='udisksctl mount -b /dev/sdb1'
alias uusb='udisksctl unmount -b /dev/sdb1'
alias eusb='udisksctl power-off -b /dev/sdb1'
alias sdx='mountjutsu'

#youtube-dl
alias ytd-aac="youtube-dl --extract-audio --audio-format aac "
alias ytd-best="youtube-dl --extract-audio --audio-format best "
alias ytd-flac="youtube-dl --extract-audio --audio-format flac "
alias ytd-m4a="youtube-dl --extract-audio --audio-format m4a "
alias ytd-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias ytd-opus="youtube-dl --extract-audio --audio-format opus "
alias ytd-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias ytd-wav="youtube-dl --extract-audio --audio-format wav "
alias ytd-best="youtube-dl -f bestvideo+bestaudio "
alias ytd='youtube-dl'
alias ytdF='youtube-dl -F'
alias ytdf='youtube-dl -f'
alias ytv='youtube-viewer -C'

#MAIL
alias mail='neomutt'
alias mp="cp mp ~/.muttrc"
alias ib="cp ib ~/.muttrc"
alias rr="cp rr ~/.muttrc"

#TRANSMISSION

alias pfx='peerflix -k'
alias tfx='torrentflix'

tsmcc() {
        transmission-remote -l | grep 100% | grep Done | \
        awk '{print $1}' | xargs -n 1 -I % transmission-remote -t % -r ;}
tsm() { transmission-remote --list ;}
        # numbers of ip being blocked by the blocklist
        # credit: smw from irc #transmission
tsmcnt() { echo "Blocklist rules:" $(curl -s --data \
        '{"method": "session-get"}' localhost:9091/transmission/rpc -H \
        "$(curl -s -D - localhost:9091/transmission/rpc | grep X-Transmission-Session-Id)" \
        | cut -d: -f 11 | cut -d, -f1) ;}
tsmbl() { $PATH_SCRIPTS/blocklist.sh ;}         # update blocklist
tsmdmn() { transmission-daemon ;}
tsmquit() { killall transmission-daemon ;}
tsmase() { transmission-remote --alt-speed ;}       # limit bandwidth
tsmasd() { transmission-remote --no-alt-speed ;}   # dont limit bandwidth
tsmadd() { transmission-remote --add "$1" ;}
tsmaskp() { transmission-remote -t"$1" --reannounce ;}
tsmstop() { transmission-remote -t"$1" --stop ;}              # <id> or all
tsmstart() { transmission-remote -t"$1" --start ;}             # <id> or all
tsmpurge() { transmission-remote -t"$1" --remove-and-delete ;} # delete data also
tsmdel() { transmission-remote -t"$1" --remove ;}           # leaves data alone
tsminfo() { transmission-remote -t"$1" --info ;}
tsmspeed() { while true;do clear; transmission-remote -t"$1" -i | grep Speed;sleep 1;done ;}

#nnn
#alias nnn='nnn -d'
#[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"
#n()
#{
#        export NNN_TMPFILE=${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd
#
#        nnn "$@"
#
#        if [ -f $NNN_TMPFILE ]; then
#                . $NNN_TMPFILE
#                rm -f $NNN_TMPFILE > /dev/null
#        fi
#}

#MIS
alias sys='sudo systemctl'
alias vol='ncpamixer'
alias def='sdcv'
alias radio='curseradio'
alias music='ncmpcpp'
alias sv='sudo vim'
alias ibus='ibus-daemon -xdr'
alias wp='QuickWall --setter feh'
alias rit='rtv'
alias keep='keepcli'
alias drive='gdrive'
alias books='pysheng'
alias imgur='imgur_downloader'
alias myip='ip addr show'
alias weather='curl wttr.in/khagrachari'
alias e.g='tldr'

alias vim='nvim'
#alias tweet='turses'


#GIT
alias gitc='git clone'
alias gitu='git push -u origin master'
alias gitca='git commit -a'
alias gita='git add'
alias gits='git status'

#ARCHIVE
alias uz='atool -x'
alias zip='atool -a'

#SURFRAW
alias srs='sr startpage'
alias srb='sr bing'
alias srd='sr duckduckgo'
alias srg='sr google'
alias srv='sr youtube'
alias sry='sr yahoo'
alias sraw='sr archwiki'
alias sraur='sr aur'
alias srpkg='sr archpkg'
alias srmdb='sr imdb'
alias srgit='sr github'
alias sru='sr urban'
alias srpb='sr piratebay'

#torsocks
alias tor='sys start tor.service'
alias tors='sys stop tor.service'
alias ctorg='torsocks qutebrowser 'https://check.torproject.org/''
alias ctorc='torsocks elinks 'https://check.torproject.org/''
alias torb='~/AUR/tor-browser_en-US/Browser/./start-tor-browser'

#SSH
alias fst='sudo systemctl start sshd'
alias fsts='sudo systemctl stop sshd'
alias termux='ssh -p 8022 u0_a127@192.168.137.234'

#PNGLatex
#pnglatex -h for help
alias eq='pnglatex -b Transparent -d 300 -s 12'

#POWERMANAGEMENT
#alias iph='i3exit suspend'
#alias ipl='i3exit lock'
#alias ips='i3exit shutdown'
#alias ipr='i3exit reboot'

alias q='exit'


#Bind
#bindkey -v

#POWERLEVEL9K

POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_COLOR_SCHEME='dark'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history vi_mode time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

OS_ICON='\uF303'

#Context
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='031'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='0'

#Time
#POWERLEVEL9K_TIME_BACKGROUND='240'
#POWERLEVEL9K_TIME_FOREGROUND='249'

#Dir
POWERLEVEL9K_DIR_HOME_BACKGROUND='7'
POWERLEVEL9K_DIR_HOME_FOREGROUND='24'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='springgreen2'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'

#OS_ICON
POWERLEVEL9K_OS_ICON_BACKGROUND='000'
POWERLEVEL9K_OS_ICON_FOREGROUND='031'

#VCS
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='grey11'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='grey11'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='grey11'

#Status
#POWERLEVEL9K_STATUS_OK_BACKGROUND='000'
#POWERLEVEL9K_STATUS_OK_FOREGROUND='220'
#POWERLEVEL9K_STATUS_ERROR_BACKGROUND='red'
#POWERLEVEL9K_STATUS_ERROR_FOREGROUND='black'

# Vi-Mode
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='245'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='000'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='52'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='7'

#HIGHLIGHT
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
ZSH_HIGHLIGHT_STYLES[default]=fg=blue,bold


#NEOFETCH
#neofetch --ascii_distro arcolinux_small
alias neo='neofetch --ascii_distro arcolinux_small'

