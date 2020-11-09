#EXPORT 
export TERM="xterm-256color"
export TERM="st-256color"
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=dbus
export QT_IM_MODULE=ibus
export ZSH="/home/masud/.oh-my-zsh"

#PLUGINS
plugins=(git extract zsh-autosuggestions zsh-syntax-highlighting zsh-completions vi-mode)

#SOURCE
source $ZSH/oh-my-zsh.sh
source /home/masud/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
#source /home/masud/powerlevel10k/powerlevel10k.zsh-theme

#Theme
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME=powerlevel10k/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
