#!/bin/sh
#env ASSUME_ALWAYS_YES=yes pkg update -y && pkg upgrade -y
#pkg update -y && pkg upgrade -y
#env ASSUME_ALWAYS_YES=yes pkg install libjansson openssh wget nano -y
apt-get update && apt-get upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano jq wget

USER=$(whoami)


wget https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/ccminer
echo "main" > ~/ccminer/actualversion.conf

chmod +x ~/ccminer/ccminer
curl -s https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/upgrade_SBC.sh > ~/ccminer/upgrade_SBC.sh
curl -s https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/upgrademiner.sh > ~/ccminer/upgrademiner.sh
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
~/ccminer/ccminer -c ~/ccminer/config.json
EOF
chmod +x start.sh


