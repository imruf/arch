#! /bin/bash 
compton --config ~/.config/i3/compton.conf &
numlockx on &
xinput set-prop 14 284 1
feh --bg-scale ~/Pictures/feh/wallpaper/galaxy.jpg
redshift &

dte(){
  dte="$(date +"%A, %B %d | 🕒 %l:%M%p")"
  echo -e "$dte"
}

#upd(){
#  upd=`checkupdates | wc -l`
#  echo -e "⟳ $upd updates"
#}

mem(){
  mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "$mem"
}

cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "$cpu% cpu"
}

while true; do
     xsetroot -name "$(cpu) | $(mem) | $(dte)"
     sleep 10s    # Update time every ten seconds
done &
