bold=$(tput bold)
reset=$(tput sgr0)
colw=$(tput setaf 15)
colgo=$(tput setaf 190)
colc=$(tput setaf 38)
colgr=$(tput setaf 78)
coly=$(tput setaf 226)
colso=$(tput setaf 71)
coltt=$(tput setaf 33)
colost=$(tput setaf 172)


# PS1='\[$bold\]\[$colw\][\[$reset\]\[$bold\]\[$colgo\]  \[$reset\]\[$bold\]\[$coltt\]  \[$reset\] \[$bold\]\[$colgr\]\w\[$reset\]\[$bold\]\[$colw\] ]\[$reset\]\[$bold\]\[$colc\] >> \[$reset\]'

PS1='\[$bold\]\[$colw\][\[$reset\]\[$bold\]\[$colost\]\u\[$reset\]\[$bold\]\[$colw\]@\[$reset\]\[$bold\]\[$colc\]\h\[$reset\]\[$bold\]\[$coly\] \[$reset\]\[$bold\]\[$colgr\]\w\[$reset\]\[$bold\]\[$colw\]]\[$reset\]\[$bold\]\[$colc\] >> \[$reset\]'

# PS1='\[$bold\]\[$colw\][\[$reset\]\[$bold\]\[$colost\]\u\[$reset\]\[$bold\]\[$colw\]@\[$reset\]\[$bold\]\[$colc\]\h\[$reset\]\[$bold\]\[$coly\]  \[$reset\]\[$bold\]\[$colgr\]\w\[$reset\]\[$bold\]\[$colw\]]\[$reset\]\[$bold\]\[$colc\] >> \[$reset\]'
# PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '


# PS1="%B%F{15}[%f%F{172}%n%f%F{15}@%f%F{38}%M%f %F{78}%~%f%F{15}]%f %F{038}>%f%b "



#Alias
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/aliasrc"

#[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/zshfnrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shellrc/zshfnrc"
