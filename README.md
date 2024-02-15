
- Type `y` then enter key in any prompts!
```
pkg update -y && pkg upgrade -y
pkg install libjansson wget nano -y
```
3. Download ccminer, config, start:
```
curl o -k https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/install.sh | bash
```
```
bash ~/ccminer/upgrade.sh %
```
```
bash ~/ccminer/upgrademiner.sh 
```
nano config.json
```
2. Start ccminer with:
```
~/ccminer/start.sh
```
3. Close ccminer with:
```
CTRL + c
```
# Tips & Tricks:
- If Termux can't complete update & upgrade please clear app cache and data.
- Disable battery manager, battery optimization for Termux app.
- If you long press anywhere within Termux then click `More` there is an option to `Keep screen on`.
- Alternatively you can pull down the notification drawer and expand Termux notification to `Acquire wakelock` this will enable you to mine with the screen off **(NOTE! not all devices obey this rule is a hit or miss)**
- Use a pool with low latency to your location/internet.
- Give the miner/stratum time to stabilize hashrate(~30m-1h).
