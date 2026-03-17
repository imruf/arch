# vim:foldmethod=marker

# Alias
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/zshfnrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/zshfnrc"

# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
autoload edit-command-line; zle -N edit-command-line
# autoload -U tetris # main attraction of zsh, obviously


# completion opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' #match case
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
# zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# options
setopt append_history inc_append_history share_history # better history
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_match # make cmp case insensitive
setopt no_case_glob # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^

setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s
setopt PROMPT_SUBST

# history
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved

# vim setup
# vim binds
bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

# vim mode indicator in prompt
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

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}


# set up prompt
PROMPT='%K{237}%B%F{yellow}[%f%b%F{white}%n%f%F{magenta}@%f%F{yellow}%M %f%B%F{225}%~%f%b%B%F{yellow}]%f%b${NEW_LINE}%B${vim_mode}%b%k '
# PROMPT='%K{237}%B%F{yellow}[%f%b%F{white}%n%f%F{magenta}@%f%F{yellow}%M %f%B%F{225}%~%f%b%B%F{yellow}]%f%b${NEW_LINE%F{#E5E9F0}$(date +%H:%M)%B${vim_mode}%b%k '
#PROMPT='%K{237}%B%F{yellow}[ %f%b%F{white} %f%F{yellow} %f%B%F{225}%~%f%b%B%F{yellow} ]%f%b${NEW_LINE}%B${vim_mode}%b%k '
#PROMPT='%K{237}%B%F{15}[%f%b%F{172}%n%f%F{15}@%f%F{38}%M%f%F{226} %f%F{78}%~%f%F{15}]%f%b${NEW_LINE}%B${vim_mode}%b%k '
#PROMPT='%B%F{15}[%f%F{172}%n%f%F{15}@%f%F{38}%M%f%F{226} %f%F{78}%~%f%F{15}]%f %F{038}>%f%b${NEW_LINE}%B${vim_mode}%b%k '
# PROMPT='%B%F{15}[%f%F{172}%n%f%F{15}@%f%F{38}%M%f%F{226} %f%F{78}%~%f%F{15}]%f%b${NEW_LINE}%B${vim_mode}%b%k'
# PROMPT='%B%F{15}[%f%F{172}%n%f%F{15}@%f%F{38}%M%f%F{226} %f%F{78}%~%f%F{15} %B${vim_mode}%b] '
#PROMPT='%K{237}%B%F{yellow}[ %f%b%F{white} %f%F{yellow} %f%B%F{225}%~%f%b%B%F{yellow} ]%f%b${NEW_LINE}%B${vim_mode}%b%k '
# PROMPT="${NEWLINE}%K{#2E3440}%F{#E5E9F0}$(date +%_I:%M%P) %K{#3b4252}%F{#ECEFF4} %n %K{#4c566a} %~ %f%k ❯ " # nord theme


# zoxide shell integration
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

# pyenv shell integration
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# sourcing plugins
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Prompt{{{
# PROMPT="%B%F{15}[%f%F{172}%n%f%F{15}@%f%F{38}%M%f%F{226} %f%F{78}%~%f%F{15}]%f %F{038}>%f%b "
# PROMPT="%B%F{15}[%f%F{172}%n%f%F{15}@%f%F{38}%M%f%F{226} %f%F{78}%~%f%F{15}]%f %F{038}>%f%b "
# PROMPT="%B%F{15}[%f%F{172}%n%f%F{15}@%f%F{38}%M%f%F{226}  %f%F{78}%~%f%F{15}]%f %F{038}>%f%b "
# PROMPT="%F{blue}$(print -P '\uF303';)%f %B%F{yellow}%~%b%f
# PROMPT-%b "
# PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b
# PROMPTyellow}$(print -P '\uF303')%f %F{blue} :- %f"
# PROMPT="%B%F{148}[ %f%F{yellow}%K{black}%n%k%f%F{106}@%f%F{030}%M%f %F{208}%~%f%F{148} ]%f %F{038}>%f%b "
# PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}%b %B%{$fg[cyan]%}>%{$reset_color%}%b "}}}}}}
