#!/bin/bash

# useful system stuff
pacman -S sudo bash-completion git networkmanager wget xdotool
EDITOR=nano visudo

# yaourt
mkdir /tmp/yaourtsetup
cd /tmp/yaourtsetup
git clone https://aur.archlinux.org/package-query.git
chmod -R 777 package-query
cd package-query
sudo -u nobody makepkg -sri
cd ..
rm -rf package-query
git clone https://aur.archlinux.org/yaourt.git
chmod -R 777 yaourt
cd yaourt
sudo -u nobody makepkg -si
cd
rm -rf /tmp/yaourtsetup

# xorg and drivers
pacman -S xorg-server xorg-server-utils xf86-video-intel xf86-input-synaptics bluez bluez-utils

# desktop
pacman -S openbox obconf oblogout lxappearance-obconf-gtk3 lightdm light-locker lightdm-gtk-greeter compton plank slock
pacman -S deepin-icon-theme deepin-gtk-theme
pacman -S geany thunar ristretto evince file-roller nodejs npm blueberry guake lxterminal
yaourt -S --noconfirm lxdm-themes franz brightside skippy-xd-git

# infinality
sudo pacman-key -r 962DDE58
sudo pacman-key -f 962DDE58
sudo pacman-key --lsign-key 962DDE58
echo "
[infinality-bundle]
Server = http://bohoomil.com/repo/\$arch
[infinality-bundle-fonts]
Server = http://bohoomil.com/repo/fonts" >> /etc/pacman.conf
pacman -S infinality-bundle ibfonts-meta-base ibfonts-meta-extended

# geany themes
git clone https://github.com/codebrainz/geany-themes.git /tmp/geany-themes
mkdir -p ~/.config/geany/colorschemes
cp /tmp/geany-themes/colorschemes/* ~/.config/geany/colorschemes/
rm -rf /tmp/geany-themes
