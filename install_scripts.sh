sudo pacman -S--noconfirm --needed mpv gimp ibus ibus-m17n m17n-db texlive-science vim base-devel atool bdf-unifont ttf-roboto ttf-droid noto-fonts ttf-liberation ttf-ubuntu-font-family ttf-croscore ttf-dejavu ttf-hack ttf-font-awesome youtube-viewer youtube-dl stardict sdcv sxiv feh android-tools zathura zathura-pdf-mupdf nnn ranger mplayer mlocate numlockx tlp liberoffice-fresh mpd ncmpcpp mutt neomutt galculator optipng gtk-engines arcolinux-arc-themes-nico-git compton rxvt-unicode redshift

yay -S klatexformula ranger-git equalx marvin qutebrowser nerd-fonts-ubuntu pdftk-bin curseradio-git pnglatex
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
