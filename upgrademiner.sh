VERSION="Choix de la version: "
select CHOIX in main x1-a78-a55 em5-a76-a55 em4-a75-a55 em3-a55 a78 a78c a78-a55 a77 a77-a55 a76 a76ae a76-a55 a75 a75-a55 a73 a72 a65 a65ae a57 a55 a53 a35 a34
do
  wget https://raw.githubusercontent.com/Arhkos/termux-precompiled/$CHOIX/ccminer -o ~/ccminer/ccminer
done
chmod +x ~/ccminer/ccminer
