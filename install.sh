#!/bin/sh
#env ASSUME_ALWAYS_YES=yes pkg update -y && pkg upgrade -y
#pkg update -y && pkg upgrade -y
#env ASSUME_ALWAYS_YES=yes pkg install libjansson openssh wget nano -y
pkg install libjansson openssh wget nano screen -y

sshd
USER=$(whoami)
mkdir ~/.termux/boot/
wget https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/autoboot -O ~/.termux/boot/autoboot.sh
chmod +x ~/.termux/boot/autoboot.sh
mkdir ccminer && cd ccminer

wget https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/ccminer
chmod +x ~/ccminer/ccminer
curl -s https://raw.githubusercontent.com/Arhkos/termux-precompiled/mainupgrade.sh > ~/ccminer/upgrade.sh
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
~/ccminer/ccminer -c ~/ccminer/config.json
EOF
chmod +x start.sh

echo "$USER"
