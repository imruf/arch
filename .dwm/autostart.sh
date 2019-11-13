#! /bin/bash 

xfce4-power-manager &
feh --bg-scale ~/Pictures/feh/dwm/frank.jpg &
redshift &
numlockx on &
ibus-daemon -xdr &
compton --config ~/.config/compton/compton.conf &
#xinput set-prop 14 284 1 &


testweather() { \
	[ "$(stat -c %y "$HOME/.local/share/weatherreport" 2>/dev/null | cut -d' ' -f1)" != "$(date '+%Y-%m-%d')" ] &&
		ping -q -c 1 1.1.1.1 >/dev/null &&
		curl -s "wttr.in/$location" > "$HOME/.local/share/weatherreport" &&
		notify-send "🌞 Weather" "New weather forecast for today." &&
		refbar
		}
#function get_bytes {
#interface=$(ip route get 8.8.8.8 2>/dev/null| awk '{print $5}')
#line=$(grep $interface /proc/net/dev | cut -d ':' -f 2 | awk '{print "received_bytes="$1, "transmitted_bytes="$9}')
#eval $line
#now=$(date +%s%N)
#}
#
#function get_velocity {
#value=$1
#old_value=$2
#now=$3
#
#timediff=$(($now - $old_time))
#velKB=$(echo "1000000000*($value-$old_value)/1024/$timediff" | bc)
#if test "$velKB" -gt 1024
#then
#	echo $(echo "scale=2; $velKB/1024" | bc)MB/s
#else
#	echo ${velKB}KB/s
#fi
#}
#
## Get initial values
#get_bytes
#old_received_bytes=$received_bytes
#old_transmitted_bytes=$transmitted_bytes
#old_time=$now

wifi(){
    ssid=$(iwgetid -r)
    sig=$(grep "^\s*w" /proc/net/wireless | awk '{ print "", int($3 * 100 / 70) "%" }')
    if [ "${ssid}" == is@wp ] || [ "${ssid}" == R4X ]; then
	    echo -e "$ssid $sig"
    else
        echo -e "?"
    fi
}

dte(){
  dte="$(date +" %d %b, %a|%H:%M ")"
  echo -ne "$dte"
}

bat(){
    status="$(cat /sys/class/power_supply/AC0/online)"
    battery="$(cat /sys/class/power_supply/BAT0/capacity)"
    timer="$(acpi -b | grep "Battery" | awk '{print $5}' | cut -c 1-5)"
    if [ "${status}" == 1 ]; then
      echo -ne " 🗲 "
    else
	for x in /sys/class/power_supply/BAT0/capacity;
	do
	case "$(cat $x)" in
		100|9[0-9])	echo -ne "" ;;
		8[0-9]|7[0-9])	echo -ne "" ;;
		6[0-9]|5[0-9])	echo -ne "" ;;
		4[0-9]|3[0-9])	echo -ne "" ;;
		*)		echo -ne "" ;;
	esac
	done
    fi
}

mem(){
  mem=`free | awk '/Mem/ {printf "%d MiB\n", $3 / 1024.0}'`
  echo -ne "\x09" " $mem"
}

cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -ne "$cpu% "
}

vol() {
    volume=$(pavolume.sh)
    echo -e "$volume"
}

#mpd() {
#    mpd=$(ncmp)
#    echo -e "$mpd"
#}

wr() {
    [ "$(stat -c %y "$HOME/.local/share/weatherreport" 2>/dev/null | cut -d' ' -f1)" = "$(date '+%Y-%m-%d')" ] &&
		sed '16q;d' "$HOME/.local/share/weatherreport" | grep -wo "[0-9]*%" | sort -n | sed -e '$!d' | sed -e "s/^/ /g" | tr -d '\n' &&
		sed '13q;d' "$HOME/.local/share/weatherreport" | grep -o "m\\(-\\)*[0-9]\\+" | sort -n -t 'm' -k 2n | sed -e 1b -e '$!d' | tr '\n|m' ' ' | awk '{print " ",$1 "°","",$2 "°"}'
    }

while true; do
   testweather &
   wait
#	# Get new transmitted, received byte number values and current time
#	get_bytes
#
#	# Calculates speeds
#	up=$(get_velocity $received_bytes $old_received_bytes $now)
#   down=$(get_velocity $transmitted_bytes $old_transmitted_bytes $now)
    
    xsetroot -name "$(mem)|$(wr)|$(cpu)|$(vol)|$(bat)|$(dte)|$(wifi)"
    sleep 60   # Update time every ten seconds
done &
