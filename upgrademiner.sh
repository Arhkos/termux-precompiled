#!/bin/bash
PS3="Choix de la version: "
CPUARCH="main x1-a78-a55 em5-a76-a55 em4-a75-a55 em3-a55 a78 a78c a78-a55 a77 a77-a55 a76 a76ae a76-a55 a75 a75-a55 a73 a72 a65 a65ae a57 a55 a53 a35 a34"

select CHOIX in $CPUARCH
do
  wget https://raw.githubusercontent.com/Arhkos/termux-precompiled/$CHOIX/ccminer -O ~/ccminer/ccminer
  break
done
chmod +x ~/ccminer/ccminer
echo "Chmod +X sur ccminer"

for session in $(screen -ls | grep -o '[0-9]\+')
do
screen -S "${session}" -X quit;
done
screen -wipe
screen -dmS miner -L ccminer/start.sh

echo "------- CCminer restarted -------"
