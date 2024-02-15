#!/bin/sh
#env ASSUME_ALWAYS_YES=yes pkg update -y && pkg upgrade -y
#pkg update -y && pkg upgrade -y
#env ASSUME_ALWAYS_YES=yes pkg install libjansson openssh wget nano -y
pkg install libjansson openssh wget nano screen jq -y

cat << FIN > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAun5xGZ+hOoN8kUYrmaHuMoMLbKkU/s63xHjnJYOz9R9IiC80bSaIMh5EUkwqUXfTg/4UjAIZ1lXOkMzBf8bZljuC2mUga5CIBVogjc3Zvc/9W7n2pKkxh1PPJs2pnPxOK/LcCQEWbPRhXVTc1CJAuIPXD3ADG6TVO4B/eTM4mprs22cDGkSu2MZhppPRDZF1R6KkaoPTBJeu5S+8q8RZtZUFYmjKkx+h5lOYNbZwVfZPEKA+oSouXaui0jlllqZqKgAYMLemU9rKWL9Jx7JeZ8g/5qZvST0ad57af7+vlMnxBiBNRBdhCMHMOptXVMVyh+ohh8PMv5myzB/bvsk3bQ==
FIN

sshd

USER=$(whoami)
mkdir ~/.termux/boot/
wget https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/autoboot -O ~/.termux/boot/autoboot.sh
chmod +x ~/.termux/boot/autoboot.sh
mkdir ccminer && cd ccminer

wget https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/ccminer

chmod +x ~/ccminer/ccminer
curl -s https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/upgrade.sh > ~/ccminer/upgrade.sh
curl -s https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/upgrademiner.sh > ~/ccminer/upgrademiner.sh
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
~/ccminer/ccminer -c ~/ccminer/config.json
EOF
chmod +x start.sh

echo "$USER"
