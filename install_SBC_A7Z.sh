#!/bin/bash

# 1. Mise à jour des dépôts
sudo apt-get update

# 2. Installation des dépendances (libssl1.1 est déjà géré par les dépôts officiels)
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano jq wget libssl1.1

# --- SECTION SUPPRIMÉE ---
# On ne télécharge plus le .deb d'Ubuntu qui cassait libcurl
# --------------------------

# 3. Préparation du dossier de minage
# Utilisation de $HOME pour que ça marche aussi bien pour l'utilisateur 'radxa' que 'root'
mkdir -p ~/ccminer && cd ~/ccminer

# 4. Téléchargement du mineur
wget https://github.com/Oink70/CCminer-ARM-optimized/releases/download/v3.8.3-4/ccminer-3.8.3-4_ARM -O ~/ccminer/ccminer
chmod +x ~/ccminer/ccminer
echo "main" > ~/ccminer/actualversion.conf

# 5. Récupération des scripts additionnels
curl -s https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/upgrade_SBC.sh > ~/ccminer/upgrade_SBC.sh
curl -s https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/upgrademiner.sh > ~/ccminer/upgrademiner.sh
curl -s https://raw.githubusercontent.com/Arhkos/termux-precompiled/main/g_SBC.sh > ~/ccminer/g_SBC.sh

# 6. Création du script de démarrage
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
~/ccminer/ccminer -c ~/ccminer/config.json
EOF

chmod +x ~/ccminer/start.sh
chmod +x ~/ccminer/upgrade_SBC.sh
chmod +x ~/ccminer/g_SBC.sh

# 7. Automatisation au démarrage (Correction du chemin /root/ en dynamique)
(crontab -l 2>/dev/null; echo "@reboot $HOME/ccminer/g_SBC.sh") | crontab -

# 8. Lancement de la mise à jour finale
bash ~/ccminer/upgrade_SBC.sh