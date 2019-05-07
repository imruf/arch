# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/masud/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="/usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract zsh-autosuggestions zsh-syntax-highlighting zsh-completions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

export EDITOR=vim


export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=dbus
export QT_IM_MODULE=ibus

#list
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias lah='ls -lah --color=auto'
alias l='ls' 					
alias l.="ls -A | egrep '^\.'"      

#fix obvious typo's
alias cd..='cd ..'
alias pdw="pwd"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"

#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman or pm
alias pac='sudo pacman --color auto'
alias update='sudo pacman -Syyu'
alias up='sudo pacman -Syu'
alias rmv='sudo pacman -Rns'
alias pacs='pacman -Ss'


# yay as aur helper - updates everything
alias upaur="yay -Syu --noconfirm"

#ps
alias ps="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#improve png
#alias fixpng="find . -type f -name "*.png" -exec convert {} -strip {} \;"

#add new fonts
alias fc='sudo fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - Beware
alias skel='cp -rf /etc/skel/* ~'
#backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

#copy bashrc-latest over on bashrc - cb= copy bash
alias cb="cp ~/.bashrc-latest ~/.bashrc && source ~/.bashrc"

#quickly kill conkies
alias kc='killall conky'

#hardware info --short
alias hw="hwinfo --short"

#skip integrity check
alias yayskip='yay -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood 
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias mirrorb="sudo reflector -f 10 --country Bangladesh --save /etc/pacman.d/mirrorlist"

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo mount -t vboxsf -o rw,uid=1000,gid=1000 Public /home/$USER/Public"

#shopt
#shopt -s cdspell # autocorrects cd misspellings
#shopt -s cmdhist # save multi-line commands in history as single line
#shopt -s dotglob
#shopt -s histappend # do not overwrite history
#shopt -s expand_aliases # expand aliases

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

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -100"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'


alias sys='sudo systemctl'
alias mount='udisksctl mount -b'
alias ytv='youtube-viewer -C'
alias ytd='youtube-dl'
alias ytdF='youtube-dl -F'
alias ytdf='youtube-dl -f'
alias inp='sudo pacman -S'
alias inpkg='makepkg -si'
alias mail='neomutt'
alias dic='sdcv'
alias music='ncmpcpp'
alias updb='sudo updatedb'
alias radio='curseradio'
alias music='ncmpcpp'
alias sv='sudo vim'

#Git
alias gc='git clone'
alias gu='git push -u origin master'
alias gca='git commit -a'
alias ga='git add'
alias gs='git status'

#Archive
alias uz='atool -x'
alias zip='atool -a'


#Bind
#bindkey -v



#Powerlevel9k


#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_context_FOREGROUND='red'
#POWERLEVEL9K_context_BACKGROUND='blue'
#POWERLEVEL9K_TIME_FOREGROUND='red'
#POWERLEVEL9K_TIME_BACKGROUND='blue'
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
#POWERLEVEL9K_OS_ICON_BACKGROUND="white"
#POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
#POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
#POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"

POWERLEVEL9K_MODE='awesome-fontconfig'

#POWERLEVEL9K_COLOR_SCHEME='light'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

OS_ICON='\uF300'



POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='039'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='000'


POWERLEVEL9K_TIME_BACKGROUND='039'
POWERLEVEL9K_TIME_FOREGROUND='000'

POWERLEVEL9K_DIR_HOME_BACKGROUND='6'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='springgreen2'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'

POWERLEVEL9K_OS_ICON_BACKGROUND='000'
POWERLEVEL9K_OS_ICON_FOREGROUND='024'

POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='grey11'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='grey11'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='grey11'

POWERLEVEL9K_STATUS_OK_BACKGROUND='6'
POWERLEVEL9K_STATUS_OK_FOREGROUND='black'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='red'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='black'
#POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="007"


#Highligh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue
ZSH_HIGHLIGHT_STYLES[default]=fg=white,bold


neofetch --ascii_distro arcolinux_small
#neofetch
