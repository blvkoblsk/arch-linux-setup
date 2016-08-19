#!/bin/bash

# optional step if you install Arch from within another Linux, e.g. if the installer image doesn't boot on your laptop

cd /tmp
curl -O https://mirrors.kernel.org/archlinux/iso/2016.08.01/archlinux-bootstrap-2016.08.01-x86_64.tar.gz
tar xzf <path-to-bootstrap-image>/archlinux-bootstrap-2016.08.01-x86_64.tar.gz
/tmp/root.x86_64/bin/arch-chroot /tmp/root.x86_64/

pacman-key --init
pacman-key --populate archlinux

# change to another server, for me this one is the nearest
echo "Server = http://mirror1.htu.tugraz.at/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist

# sync package lists an install nano
pacman -Sy nano
