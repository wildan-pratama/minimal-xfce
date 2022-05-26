#!/bin/sh

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list 

# Install sudo and additional package
apt update
apt install sudo wget curl zsh apt-transport-https software-properties-common -y
sudo usermod -aG sudo $USER

# Add MX21 repo
cp mx.list /etc/apt/sources.list.d/mx.list
curl http://teharris.net/mx21repo.asc -o /etc/apt/trusted.gpg.d/mx21repo.asc

# Add Brave repo
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# install nala
#echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
#wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
#apt update
#apt install nala -y

# Install XFCE Desktop
apt-get update && apt-get upgrade -y
apt-get install neofetch xfce4-appfinder xfce4-battery-plugin xfce4-datetime-plugin xfce4-diskperf-plugin xfce4-fsguard-plugin xfce4-genmon-plugin xfce4-mount-plugin xfce4-netload-plugin xfce4-notifyd xfce4-panel xfce4-places-plugin xfce4-power-manager xfce4-power-manager-data xfce4-power-manager-plugins xfce4-pulseaudio-plugin xfce4-screenshooter xfce4-session xfce4-settings xfce4-systemload-plugin xfce4-taskmanager xfce4-terminal xfce4-timer-plugin xfce4-verve-plugin xfce4-wavelan-plugin xfce4-xkb-plugin xfwm4 xfconf xfdesktop4 xfdesktop4-data thunar network-manager network-manager-gnome network-manager-openvpn network-manager-openvpn-gnome xfce4-appmenu-plugin brave-browser ark mx-repo-manager mx-packageinstaller mx-remaster fonts-noto-color-emoji fonts-firacode fonts-font-awesome libqt5svg5 qml-module-qtquick-controls unzip lxappearance ttf-mscorefonts-installer -y

# Deb install 
dpkg -i './deb/ulauncher.deb'
apt --fix-broken install -y

# Disable OS Prober
echo 'GRUB_DISABLE_OS_PROBER=false' >> /etc/default/grub
update-grub

# Download Nordic Theme
git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic

# Fira Code Nerd Font variant needed
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/FiraCode.zip
unzip FiraCode.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/Meslo.zip
unzip Meslo.zip -d /usr/share/fonts
fc-cache -vf

unzip icons.zip -d /usr/share/
unzip config.zip -d /home/$USER
rm -rf /usr/share/backgrounds
unzip backgrounds.zip -d /usr/share/
mv .gtkrc-2.0 /home/$username/.gtkrc-2.0
chown -R $USER:$USER /home/$USER

apt remove --purge roxterm* -y
apt autoremove -y && apt autoclean -y
