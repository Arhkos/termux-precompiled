#!/bin/sh
pkg update -y && pkg upgrade -y
pkg install libjansson wget nano -y
mkdir ccminer && cd ccminer

wget https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/ccminer
chmod +x ~/ccminer/ccminer
curl -s https://raw.githubusercontent.com/Arhkos/VerusCliMining/main/upgrade.sh > ~/ccminer/upgrade.sh
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
~/ccminer/ccminer -c ~/ccminer/config.json
EOF
chmod +x start.sh
