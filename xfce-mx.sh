#!/bin/sh

#Install sudo and additional package
apt install sudo wget curl && sudo usermod -aG sudo $USER

#Add MX21 repo
cp mx.list /etc/apt/sources.list.d/mx.list
curl http://teharris.net/mx21repo.asc -o /etc/apt/trusted.gpg.d/mx21repo.asc

#install nala
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
apt update && sudo apt install nala

#Install XFCE Desktop
nala update && nala install xfce-superkey-mx xfce4-appfinder xfce4-battery-plugin xfce4-clipman xfce4-cpufreq-plugin xfce4-cpugraph-plugin xfce4-datetime-plugin xfce4-diskperf-plugin xfce4-docklike-plugin xfce4-fsguard-plugin xfce4-genmon-plugin xfce4-mount-plugin xfce4-netload-plugin xfce4-notes xfce4-notes-plugin xfce4-notifyd xfce4-panel xfce4-places-plugin xfce4-power-manager xfce4-power-manager-data xfce4-power-manager-plugins xfce4-pulseaudio-plugin xfce4-screenshooter xfce4-sensors-plugin xfce4-session xfce4-settings xfce4-smartbookmark-plugin xfce4-systemload-plugin xfce4-taskmanager xfce4-terminal xfce4-timer-plugin xfce4-verve-plugin xfce4-wavelan-plugin xfce4-weather-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin xfwm4 xfconf xfdesktop4 xfdesktop4-data thunar-archive-plugin thunar-shares-plugin thunar-data thunar-gtkhash thunar-volman thunar-custom-actions-mx network-manager network-manager-gnome network-manager-openvpn network-manager-openvpn-gnome xfce4-appmenu-plugin
