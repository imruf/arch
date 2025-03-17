# vim:foldmethod=marker

autoload -U colors && colors	# Load colors
setopt autocd
stty stop undef
setopt interactive_comments

HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS

# Alias
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/zshfnrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/zshfnrc"

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -v '^?' backward-delete-char


setopt PROMPT_SUBST

vim_ins_mode="%F{15}:%f%F{6}-> %f"
vim_cmd_mode="%F{9}<-%f%F{3}:%f"
vim_mode=$vim_ins_mode


function zle-keymap-select () {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish
NEW_LINE=$'\n'

PROMPT='%K{237}%B%F{yellow}[ %f%b%F{white} %f%F{yellow} %f%B%F{225}%~%f%b%B%F{yellow} ]%f%b${NEW_LINE}%B${vim_mode}%b%k '

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete


eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"



source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null



# PreviousSetups{{{
# source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

# source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zsh-vcs-prompt/zshrc.sh 2>/dev/null
# source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
# source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zsh-completions/zsh-completions.plugin.zsh 2>/dev/null
# source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/history-substring-search/history-substring-search.zsh 2>/dev/null
# source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/fsh/fast-syntax-highlighting.plugin.zsh 2>/dev/null


# [[ $UID -eq 0 ]] && local user_symbol='%F{red}#%f' ||  local user_symbol='%F{green}$%f'


# History Options
# setopt BANG_HIST                 # Treat the '!' character specially during expansion.
# setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
# setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
# setopt SHARE_HISTORY             # Share history between all sessions.
# setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
# setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
# setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
# setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
# setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
# setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
# setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
# setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
# setopt HIST_BEEP                 # Beep when accessing nonexistent history.



# Prompt
# PS1="%B%F{15}[%f%F{172}%n%f%F{15}@%f%F{38}%M%f%F{226} %f%F{78}%~%f%F{15}]%f %F{038}>%f%b "
# PS1="%B%F{15}[%f%F{172}%n%f%F{15}@%f%F{38}%M%f%F{226} %f%F{78}%~%f%F{15}]%f %F{038}>%f%b "
# PS1="%B%F{15}[%f%F{172}%n%f%F{15}@%f%F{38}%M%f%F{226}  %f%F{78}%~%f%F{15}]%f %F{038}>%f%b "
# PS1="%F{blue}$(print -P '\uF303';)%f %B%F{yellow}%~%b%f
# %B:-%b "
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b
# %F{yellow}$(print -P '\uF303')%f %F{blue} :- %f"
# PS1="%B%F{148}[ %f%F{yellow}%K{black}%n%k%f%F{106}@%f%F{030}%M%f %F{208}%~%f%F{148} ]%f %F{038}>%f%b "
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}%b %B%{$fg[cyan]%}>%{$reset_color%}%b "}}}
