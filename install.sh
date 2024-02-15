#!/bin/sh
#env ASSUME_ALWAYS_YES=yes pkg update -y && pkg upgrade -y
#pkg update -y && pkg upgrade -y
#env ASSUME_ALWAYS_YES=yes pkg install libjansson openssh wget nano -y
pkg install libjansson openssh wget nano screen jq -y
sshd

USER=$(whoami)
mkdir ~/.termux/boot/
wget https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/autoboot -O ~/.termux/boot/autoboot.sh
chmod +x ~/.termux/boot/autoboot.sh
mkdir ccminer && cd ccminer

PS3="Choix de la version: "
select CHOIX in main x1-a78-a55 em5-a76-a55 em4-a75-a55 em3-a55 a78 a78c a78-a55 a77 a77-a55 a76 a76ae a76-a55 a75 a75-a55 a73 a72 a65 a65ae a57 a55 a53 a35 a34
do
  wget https://raw.githubusercontent.com/Arhkos/termux-precompiled/$CHOIX/ccminer -o ~/ccminer/ccminer
done
chmod +x ~/ccminer/ccminer
curl -s https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/upgrade.sh > ~/ccminer/upgrade.sh
curl -s https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/upgrademiner.sh > ~/ccminer/upgrademiner.sh
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
~/ccminer/ccminer -c ~/ccminer/config.json
EOF
chmod +x start.sh

echo "$USER"
