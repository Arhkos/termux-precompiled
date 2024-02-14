#!/bin/bash

echo "Update du config.json"

echo "Verification de l'argument"
if [-z "$1"]
then
	echo "Pas de nom (missing arg)"
	exit 1
fi
echo "Argument existant"

#read  -p "Nom du mineur = " NAME
MINER=RQpFtHQ8eTT4Dgpn5Te1cB1Jrp5NE1KvzP
MINERNAME=$MINER.$1


wget https://raw.githubusercontent.com/Arhkos/VerusCliMining/main/config.json -O ~/ccminer/config.json
echo "config.json copied  "
echo "Update de la config pour $1"
tmpfile=$(mktemp); cp ~/ccminer/config.json "$tmpfile" && jq --arg newval "$MINERNAME" '.user |= $newval' "$tmpfile" >~/ccminer/config.json && rm -f "$tmpfile"
chmod +x ~/g.sh

echo "pkill screen
screen -wipe
screen -dmS miner -L ccminer/start.sh" > ~/g.sh

bash ~/g.sh

echo "Update ok"
