#autoload -U colors && colors	# Load colors

PS1="%B%F{#b16286}[%F{#d2691e%}%n%F{#b16286}@%F{#cd5555%}%M %F{#8e388e}%~%F{#b16286}]%F{#586e75}$%b "
#PS1="%B%{$fg[yellow]%}[%n@%M %~]%{$reset_color%}$%b "

#EXPORT 
#export TERM="xterm-256color"
export TERM="st-256color"
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=dbus
export QT_IM_MODULE=ibus
export ZSH="/home/masud/.oh-my-zsh"

#PLUGINS
plugins=(git-prompt zsh-autosuggestions zsh-syntax-highlighting zsh-completions vi-mode)

#SOURCE
source $ZSH/oh-my-zsh.sh
#source ~/.local/share/icons-in-terminal/icons_bash.sh

#source /home/masud/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

#Theme
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME=powerlevel10k/powerlevel10k

#Alias
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

#Functions

fzf_file() { zle -I; FILE=$(fd -H -t f 2> /dev/null | fzf +m) && vim "$FILE" ; }; zle -N fzf_file;
fzf_cd() { zle -I; DIR=$(fd -H -t d 2> /dev/null | fzf +m) && cd "$DIR" ; }; zle -N fzf_cd; bindkey '^F' fzf_cd
fzf_history() { zle -I; eval $(history | fzf -e +i +s | sed 's/ *[0-9]* *//') ; }; zle -N fzf_history; bindkey '^H' fzf_history
fzf_kill() { zle -I; ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9} ; }; zle -N fzf_kill; bindkey '^K' fzf_kill

# fzf_file() { zle -I; FILE=$(find ${1:-.} -type f -print 2> /dev/null | fzf +m) && vim "$FILE" ; }; zle -N fzf_file;
# fzf_cd() { zle -I; DIR=$(find ${1:-.} -type d -print 2> /dev/null | fzf +m) && cd "$DIR" ; }; zle -N fzf_cd; bindkey '^F' fzf_cd
# fzf_config() { zle -I; du -a ~/.scripts/* ~/.config/* | awk '{print $2}' | fzf | xargs -r $EDITOR }; zle -N fzf_config; bindkey '^E' fzf_config
# ffd() { zle -I; DIR=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) && cd "$DIR" ; }; zle -N ffd; bindkey '^F' ffd

tsmcc() {
        transmission-remote -l | grep 100% | grep Done | \
        awk '{print $1}' | xargs -n 1 -I % transmission-remote -t % -r ;} #clearcompleted
tsm() { transmission-remote --list ;}
        # numbers of ip being blocked by the blocklist
        # credit: smw from irc #transmission-status
tsmcnt() { echo "Blocklist rules:" $(curl -s --data \
        '{"method": "session-get"}' localhost:9091/transmission/rpc -H \
        "$(curl -s -D - localhost:9091/transmission/rpc | grep X-Transmission-Session-Id)" \
        | cut -d: -f 11 | cut -d, -f1) ;} #tsm-count
tsmbl() { $PATH_SCRIPTS/blocklist.sh ;}         # update blocklist
tsmdmn() { transmission-daemon ;} #tsm-daemon
tsmquit() { killall transmission-daemon ;} #killtsm
tsmaspd() { transmission-remote --alt-speed ;}       # limit bandwidth
tsmnaspd() { transmission-remote --no-alt-speed ;}   # dont limit bandwidth
tsmadd() { transmission-remote --add "$1" ;} #add torrent
tsmaskp() { transmission-remote -t"$1" --reannounce ;} #ask more peers
tsmstop() { transmission-remote -t"$1" --stop ;}              # stop <id> or all 
tsmstart() { transmission-remote -t"$1" --start ;}             # start <id> or all
tsmpurge() { transmission-remote -t"$1" --remove-and-delete ;} # delete data also
tsmdel() { transmission-remote -t"$1" --remove ;}           # leaves data alone
tsminfo() { transmission-remote -t"$1" --info ;} #info
tsmspeed() { while true;do clear; transmission-remote -t"$1" -i | grep Speed;sleep 1;done ;}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
