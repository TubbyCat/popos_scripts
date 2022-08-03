#!/bin/env bash 
# stops & masks unused systemd services.
# may need to modify this to your needs! this will drop services such as cups (printing). 

if [[ $UID -ne 0 ]]; then 
echo 'ROOT! otherwise rm ./systemd_declutter.sh' && exit 1
fi 

STOP="systemctl stop --now"
MASK="systemctl mask --now"
LIST-ACTUAL="avahi-daemon.socket avahi-daemon.service dmesg.service ubuntu-advantage-cloud-id-shim.service ubuntu-advantage.service"
LIST-OPT="colord.service cups.path cups-browsed.service cups.service cups.socket"

$STOP  $LIST-ACTUAL && $MASK $LIST-ACTUAL
$STOP $LIST-OPTIONAL && $MASK $LIST-OPTIONAL 

# if NOT using wifi uncomment
# $STOP wpa_supplicant.service && $MASK wpa_supplicant.service

#If not using touchpad e.g. if not laptop or keyboard + touchpad user uncomment 
# $STOP touchegg.service && $MASK touchegg.service

systemctl --now daemon-reload && systemctl --now daemon reexec

echo "All done. As a parting gift, a small pictoral horror story..."
systemd-analyze security
exit 0
