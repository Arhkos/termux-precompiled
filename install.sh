#!/bin/sh
#env ASSUME_ALWAYS_YES=yes pkg update -y && pkg upgrade -y
#pkg update -y && pkg upgrade -y
#env ASSUME_ALWAYS_YES=yes pkg install libjansson openssh wget nano -y
pkg install libjansson openssh wget nano -y
passwd userpwd
sshd

wget https://raw.githubusercontent.com/Arhkos/termux-precompiled//main/autoboot -O ~/.termux/boot/start-sshd/autoboot.sh
chmod +x ~/.termux/boot/start-sshd/autoboot.sh
mkdir ccminer && cd ccminer

wget https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/ccminer
chmod +x ~/ccminer/ccminer
curl -s https://raw.githubusercontent.com/Arhkos/termux-precompiled/mainupgrade.sh > ~/ccminer/upgrade.sh
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
~/ccminer/ccminer -c ~/ccminer/config.json
EOF
chmod +x start.sh
