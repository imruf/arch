#! /bin/bash 
xfce4-power-manager &
compton --config ~/.config/compton/compton.conf &
numlockx on &
xinput set-prop 14 284 1
#variety &
feh --bg-scale ~/Pictures/feh/dwm/nano-schematic-infraorange-3840x2400.jpg
redshift &
#conky &


wifi(){
	#ip=$(ip route get 8.8.8.8 2>/dev/null|grep -Eo 'src [0-9.]+'|grep -Eo '[0-9.]+')

#	if=wlp4s0
#		while IFS=$': \t' read -r label value
#		do
#			case $label in SSID) SSID=$value
#				;;
#		#signal) SIGNAL=$value
#		#		;;
#		esac
#	done < <(iw "$if" link)
    ssid=$(iwgetid -r)
    sig=$(grep "^\s*w" /proc/net/wireless | awk '{ print "", int($3 * 100 / 70) "%" }')
	echo -e "$ssid $sig"
}

dte(){
  dte="$(date +" %d %b, %a|%H:%M  " )"
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
      echo -ne "${color6} ${color0}🗲 ${battery}%"
    else
	for x in /sys/class/power_supply/BAT0/capacity;
	do
	case "$(cat $x)" in
		100|9[0-9])	echo "" ;;
		8[0-9]|7[0-9])	echo "" ;;
		6[0-9]|5[0-9])	echo "" ;;
		4[0-9]|3[0-9])	echo "" ;;
		*)		echo "" ;;
	esac
	done
    fi
}
#bat(){
#    status="$(cat /sys/class/power_supply/AC0/online)"
#    battery="$(cat /sys/class/power_supply/BAT0/capacity)"
#    timer="$(acpi -b | grep "Battery" | awk '{print $5}' | cut -c 1-5)"
#    if [ "${status}" == 1 ]; then
#      echo -ne "${color6} ${color0}🗲 ${battery}%"
#    else
#      echo -ne "${color6} ${color0}${battery}%"
#    fi
#}

mem(){
  mem=`free | awk '/Mem/ {printf "%d MiB\n", $3 / 1024.0}'`
  #mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  #echo -e " $mem"
  echo -e " $mem"
}

cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "  $cpu%"
}

vol() {
    volume=$(pavolume.sh)
    echo -e $volume
}

#vol() {
#	volume="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
#	if test "$volume" -gt 0
#	then
#		echo -e " ${volume}"
#	else
#		echo -e ""
#	fi
#}
while true; do
    xsetroot -name "$(cpu)|$(mem)|$(vol)|$(bat)|$(dte)~$(wifi)"
     sleep 1m    # Update time every ten seconds
done &
