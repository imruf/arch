#! /bin/bash 

#wmname LG3D & #define wm name requited to run some java program

wifi() {
    ssid=$(iwgetid -r)
    sig=$(grep "^\s*w" /proc/net/wireless | awk '{ print " ", int($3 * 100 / 70) "%" }')
    wlp=$(cat /sys/class/net/wlp4s0/operstate 2>/dev/null)
    if [ "${wlp}" == up ]; then
	    echo -e "$ssid $sig"
    else
        echo -e "📡"
#        echo -e "?"
    fi
}

net() {
    nett=$(nettraf)
    echo -e "$nett"
}

#weather() {
#    wet=$(forecast)
#    echo -e "$wet"
#}

dte() {
  dte="$(date +" %a %d %b|%H:%M  ")"
  echo -e "$dte"
}

bat() {
    status="$(cat /sys/class/power_supply/AC0/online)"
    battery="$(cat /sys/class/power_supply/BAT0/capacity)"
    timer="$(acpi -b | grep "Battery" | awk '{print $5}' | cut -c 1-5)"
    if [ "${status}" == 1 ]; then
      echo -e "    $battery%"
      #echo -e " 🗲 $battery%"
    else
	for x in /sys/class/power_supply/BAT0/capacity;
	do
	case "$(cat $x)" in
		100|9[0-9])	echo -e "  $battery%" ;;
		8[0-9]|7[0-9])	echo -e "  $battery%" ;;
		6[0-9]|5[0-9])	echo -e "  $battery%" ;;
		4[0-9]|3[0-9])	echo -e "  $battery%" ;;
		*)		echo -e "  🔌 $battery%" ;;
	esac
	done
    fi
}

mem(){
  mem=`free -h | awk '/Mem/ {printf $3"B"}'`
  # mem=`free -h | awk '/Mem/ {printf $3"B" "/" $2"B"}'`
  echo -ne "░▒▒░" "  "$mem""
}

cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "$cpu%  "
}

vol() {
    volume=$(pavolume.sh)
    echo -e "$volume"
}

blight() {
    light=`brightnessctl | awk '/Current brightness:/ {print $4}'`
    echo -e " $light"
}

mybar() {
    echo "$(mem)|$(cpu)|$(blight)|$(vol)|$(bat)|$(dte)|$(net)|$(wifi)"
}

main() {
    while true; do
    xsetroot -name "$(mybar)"
    sleep 30    # Update time every given seconds
done &
}

main
