autoload -U colors && colors	# Load colors

autoload -Uz promptinit
promptinit
prompt redhat

# setopt
# setopt prompt_subst
# unsetopt nomatch
# setopt autocd		# Automatically cd into typed directory.
# setopt interactive_comments


stty stop undef		# Disable ctrl-s to freeze terminal.


# PS1="%B%F{15}[%f%F{190}  %f%F{33}  %f %F{78}%~%f %F{15}]%f%F{038} >%f%b "

PS1="%B%F{15}[%f%F{172}%n%f%F{15}@%f%F{38}%M%f%F{226} %f%F{78}%~%f%F{15}]%f %F{038}>%f%b "
# PS1="%B%F{15}[%f%F{172}%n%f%F{15}@%f%F{38}%M%f%F{226}  %f%F{78}%~%f%F{15}]%f %F{038}>%f%b "

# PS1="%F{blue}$(print -P '\uF303';)%f %B%F{yellow}%~%b%f
# %B:-%b "
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b
# %F{yellow}$(print -P '\uF303')%f %F{blue} :- %f"

# PS1="%B%F{148}[ %f%F{yellow}%K{black}%n%k%f%F{106}@%f%F{030}%M%f %F{208}%~%f%F{148} ]%f %F{038}>%f%b "



# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}%b %B%{$fg[cyan]%}>%{$reset_color%}%b "


# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=$XDG_CACHE_HOME/zsh/history

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line
# bindkey '^e' edit-command-line

# Alias
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/zshfnrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/zshfnrc"

# Plugin Source
source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zsh-vcs-prompt/zshrc.sh 2>/dev/null
source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zsh-completions/zsh-completions.plugin.zsh 2>/dev/null
source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/history-substring-search/history-substring-search.zsh 2>/dev/null
source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/fsh/fast-syntax-highlighting.plugin.zsh 2>/dev/null



# [[ $UID -eq 0 ]] && local user_symbol='%F{red}#%f' ||  local user_symbol='%F{green}$%f'
