sleep 10
/system/xbin/iwconfig wlan0 power all
sleep 1
/system/xbin/iwconfig wlan0 txpower 30mW
log -p i -t iwconfig "WIFI: power management enabled"
