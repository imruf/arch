#!/bin/bash

echo "removing packages"

sudo pacman -Rns vivaldi vlc pamac-aur xterm blueberry xfce4-dict geany meld ristretto sublime-text-dev bluez-firmware wpa_actiond oomox arcolinux-arc-themes-git conky-lua-archers trizen 

echo "installing packages from arch"

sudo pacman -S --noconfirm --needed mpv gimp ibus ibus-m17n m17n-db texlive-science vim base-devel atool bdf-unifont ttf-roboto ttf-droid noto-fonts ttf-liberation ttf-ubuntu-font-family ttf-croscore ttf-dejavu ttf-hack ttf-font-awesome youtube-viewer youtube-dl stardict sdcv feh android-tools zathura zathura-pdf-mupdf nnn ranger qutebrowser mplayer mlocate numlockx tlp mpd ncmpcpp mutt neomutt galculator optipng gtk-engines arcolinux-arc-themes-nico-git compton rxvt-unicode zsh-theme-powerlevel9k lxappearance

sudo pacman -S --noconfirm --needed libreroffice-still

echo "installing packages from aur"

yay -S nerd-fonts-ubuntu pdftk-bin curseradio-git pnglatex sxiv-rifle

echo "installing oh-my-zsh"

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


echo "installing zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions


echo "powerline"
sudo pip install git+git://github.com/Lokaltog/powerline
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf /usr/share/fonts/
fc-cache -vf /usr/share/fonts/
mv 10-powerline-symbols.conf /etc/fonts/conf.d/
