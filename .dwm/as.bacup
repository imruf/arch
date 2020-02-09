#! /bin/bash 

wmname LG3D & #wmname program to define wm name to run java program

wifi() {
    ssid=$(iwgetid -r)
    sig=$(grep "^\s*w" /proc/net/wireless | awk '{ print "", int($3 * 100 / 70) "%" }')
    if [ "${ssid}" == is@wp ] || [ "${ssid}" == R4X ]; then
	    echo -e "$ssid $sig"
    else
        echo -e "?"
    fi
}

dte() {
  dte="$(date +" %d %b, %a|%H:%M ")"
  echo -e "$dte"
}

bat() {
    status="$(cat /sys/class/power_supply/AC0/online)"
    battery="$(cat /sys/class/power_supply/BAT0/capacity)"
    timer="$(acpi -b | grep "Battery" | awk '{print $5}' | cut -c 1-5)"
    if [ "${status}" == 1 ]; then
      echo -e " 🗲"
    else
	for x in /sys/class/power_supply/BAT0/capacity;
	do
	case "$(cat $x)" in
		100|9[0-9])	echo -e " $battery%" ;;
		8[0-9]|7[0-9])	echo -e " $battery%" ;;
		6[0-9]|5[0-9])	echo -e " $battery%" ;;
		4[0-9]|3[0-9])	echo -e " $battery%" ;;
		*)		echo -e " $battery%" ;;
	esac
	done
    fi
}

mem(){
  mem=`free | awk '/Mem/ {printf "%d MiB\n", $3 / 1024.0}'`
  echo -ne "\x09" ░▒▓ " $mem"
}

cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "$cpu% "
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
    echo "$(mem)|$(cpu)|$(blight)|$(vol)|$(bat)|$(dte)|$(wifi)"
}

main() {
    while true; do
    xsetroot -name "$(mybar)"
    sleep 60    # Update time every ten seconds
done &
}

main
