for session in $(screen -ls | grep -o '[0-9]\+')
do
screen -S "${session}" -X quit;
done
screen -wipe
screen -dmS miner -L /root/ccminer/start.sh

