#!/bin/bash

echo "Update du config.json"

read  -p "Nom du mineur = " NAME
MINER=RQpFtHQ8eTT4Dgpn5Te1cB1Jrp5NE1KvzP
MINERNAME=$MINER.$NAME


wget https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/config.json -O ~/ccminer/config.json
echo "config.json copied  "
echo "Update de la config pour $NAME"
tmpfile=$(mktemp); cp ~/ccminer/config.json "$tmpfile" && jq --arg newval "$MINERNAME" '.user |= $newval' "$tmpfile" >~/ccminer/config.json && rm -f "$tmpfile"
chmod +x ~/g.sh

wget https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/g.sh -O ~/g.sh

bash ~/g.sh

echo "Update ok"
