#! /bin/bash 
compton --config ~/.config/i3/compton.conf &
numlockx on &
xinput set-prop 14 284 1
feh --bg-scale ~/Pictures/feh/wallpaper/galaxy.jpg
redshift &
dwmstatus &

wifi(){
	#ip=$(ip route get 8.8.8.8 2>/dev/null|grep -Eo 'src [0-9.]+'|grep -Eo '[0-9.]+')

	if=wlp4s0
		while IFS=$': \t' read -r label value
		do
			case $label in SSID) SSID=$value
				;;
	#	signal) SIGNAL=$value
	#			;;
		esac
	done < <(iw "$if" link)

	#echo -e "$SSID $SIGNAL $ip"
	echo -e "$SSID"
}

dte(){
  dte="$(date +"%d %b %a|%H:%M")"
  echo -e "$dte"
}

#upd(){
#  upd=`checkupdates | wc -l`
#  echo -e "⟳ $upd updates"
#}

bat(){
    status="$(cat /sys/class/power_supply/AC0/online)"
    battery="$(cat /sys/class/power_supply/BAT0/capacity)"
    timer="$(acpi -b | grep "Battery" | awk '{print $5}' | cut -c 1-5)"
    if [ "${status}" == 1 ]; then
      echo -ne "${color6}BAT ${color0}ON ${battery}%"
    else
      echo -ne "${color6}BAT ${color0}${battery}%"
    fi
}

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

vol() {
	volume="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
	if test "$volume" -gt 0
	then
		echo -e "\uE05D${volume}"
	else
		echo -e "Mute"
	fi
}
while true; do
    xsetroot -name "$(cpu)|$(mem)|$(vol)|$(bat)|$(dte)|$(wifi)"
     sleep 1m    # Update time every ten seconds
done &
