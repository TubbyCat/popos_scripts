#!/bin/env bash 
# stops & masks unused systemd services.
# may need to modify this to your needs! this will drop services such as cups (printing). 

STOP="systemctl stop --now"
MASK="systemctl mask --now"

if [[ $UID -ne 0 ]]; then echo 'ROOT! otherwise rm ./systemd_declutter.sh' && exit 1
fi 


$STOP  avahi-daemon.socket avahi-daemon.service  dmesg cups.path cups-browsed.service cups.service cups.socket ubuntu-advantage-cloud-id-shim.service ubuntu-advantage.service 

$MASK  avahi-daemon.service avahi-daemon.socket dmesg.service cups.path cups.socket cups.service cups-browsed.service avahi-daemon.socket avahi-daemon.service ubuntu-advantage-cloud-id-shim.service ubuntu-advantage.service

# if not using wifi uncomment
$STOP wpa_supplicant.service
$MASK wpa_supplicant.service

#If not using touchpad e.g. if not laptop or keyboard + touchpad user uncomment 
# $STOP touchegg.service && $MASK touchegg.service
