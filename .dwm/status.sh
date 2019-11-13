#! /usr/bin/env sh 

# Session and Startup
xfce4-power-manager &
feh --bg-scale ~/Pictures/feh/dwm/M106.jpg &
redshift &
numlockx on &
ibus-daemon -xdr &
compton --config ~/.config/compton/compton.conf &
#xinput set-prop 14 284 1 &


trap 'update' 5
delim="|"

testweather() { \
	[ "$(stat -c %y "$HOME/.local/share/weatherreport" 2>/dev/null | cut -d' ' -f1)" != "$(date '+%Y-%m-%d')" ] &&
		ping -q -c 1 1.1.1.1 >/dev/null &&
		curl -s "wttr.in/$location" > "$HOME/.local/share/weatherreport" &&
		notify-send "🌞 Weather" "New weather forecast for today." &&
		refbar
		}

status() { \

    mpd=$(ncmp)
    echo -ne "\x09" "$mpd $delim"

  mem=`free | awk '/Mem/ {printf "%d MiB\n", $3 / 1024.0}'`
  echo -ne " $mem $delim"

	[ "$(stat -c %y "$HOME/.local/share/weatherreport" 2>/dev/null | cut -d' ' -f1)" = "$(date '+%Y-%m-%d')" ] &&
		sed '16q;d' "$HOME/.local/share/weatherreport" | grep -wo "[0-9]*%" | sort -n | sed -e '$!d' | sed -e "s/^/ /g" | tr -d '\n' &&
		sed '13q;d' "$HOME/.local/share/weatherreport" | grep -o "m\\(-\\)*[0-9]\\+" | sort -n -t 'm' -k 2n | sed -e 1b -e '$!d' | tr '\n|m' ' ' | awk '{print " ",$1 "°","",$2 "°"}' &&
		echo "$delim"

  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  cpu_temp="$( sensors | grep 'temp1:' | cut -c16-17 | head -1)"
  echo -ne "$cpu% $cpu_temp°C  $delim"

    volume=$(pavolume.sh)
    echo -e "$volume $delim"

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
    fi && echo "$delim"

  dte="$(date +" %d %b, %a|%H:%M ")"
  echo -ne "$dte $delim"

    ssid=$(iwgetid -r)
    sig=$(grep "^\s*w" /proc/net/wireless | awk '{ print "", int($3 * 100 / 70) "%" }')
    if [ "${ssid}" == is@wp ] || [ "${ssid}" == R4X ]; then
	    echo -e "$ssid $sig"
    else
        echo -e "?"
    fi
}

update() { \
	xsetroot -name "$(status | tr '\n' ' ')" &
    wait

	# Check to see if new weather report is needed.
	testweather &
    wait
    }


while :; do
    update
	# Sleep for a minute after changing the status bar before updating it
	# again. We run sleep in the background and use wait until it finishes,
    # because traps can interrupt wait immediately, but they can't do that
    # with sleep.
	sleep 1m &
    wait
done
