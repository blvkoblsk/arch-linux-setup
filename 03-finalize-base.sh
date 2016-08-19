#!/bin/bash

# set a password for root
passwd

# uncomment locales in /etc/locale.gen
nano /etc/locale.gen
locale-gen

# prepare for wifi setup after reboot
pacman -S iw wpa_supplicant dialog

# install bootloader
pacman -S grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg

# exit the chroot
echo going to exit the chroot now, after that, unmount /mnt and reboot
echo [press any key to continue]
read
exit
