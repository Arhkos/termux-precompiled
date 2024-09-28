#!/bin/sh
#env ASSUME_ALWAYS_YES=yes pkg update -y && pkg upgrade -y
#pkg update -y && pkg upgrade -y
#env ASSUME_ALWAYS_YES=yes pkg install libjansson openssh wget nano -y
apt-get update && apt-get upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano jq wget

USER=$(whoami)

mkdir ccminer && cd ccminer
wget https://github.com/Oink70/CCminer-ARM-optimized/releases/download/v3.8.3-4/ccminer-3.8.3-4_ARM -P ~/ccminer
mv ~/ccminer/ccminer-3.8.3-4_ARM ~/ccminer/ccminer
chmod +x ~/ccminer/ccminer
echo "main" > ~/ccminer/actualversion.conf

chmod +x ~/ccminer/ccminer
curl -s https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/upgrade_SBC.sh > ~/ccminer/upgrade_SBC.sh
curl -s https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/upgrademiner.sh > ~/ccminer/upgrademiner.sh
curl -s https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/g_SBC.sh > ~/ccminer/g_SBC.sh
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
~/ccminer/ccminer -c ~/ccminer/config.json
EOF
chmod +x start.sh
chmod +x upgrade_SBC.sh
chmod +x g_SBC.sh

crontab -l | { cat; echo "@reboot /root/ccminer/g_SBC.sh"; } | crontab -


bash upgrade_SBC.sh

