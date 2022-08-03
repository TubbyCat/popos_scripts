#!/bin/env bash
function Meow()
{
    cat<<"EOF"
████████ ██    ██ ██████  ██████  ██    ██  ██████  █████  ████████ 
   ██    ██    ██ ██   ██ ██   ██  ██  ██  ██      ██   ██    ██    
   ██    ██    ██ ██████  ██████    ████   ██      ███████    ██    
   ██    ██    ██ ██   ██ ██   ██    ██    ██      ██   ██    ██    
   ██     ██████  ██████  ██████     ██     ██████ ██   ██    ██                                                                       
EOF
}
Meow
if [[ $UID -ne 0 ]]; then
echo "ROOT MEOWTHERFLUFFER! ROOT!"
exit 1
else
echo "Un-Fluffing common files & directories for security."
fi

##WIP ##

## BOOT

## ETC

## HOME

## USR

## VAR

