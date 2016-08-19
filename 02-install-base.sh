#!/bin/bash

# somewhere before you have to do partitioning and mount the root to /mnt and if needed the efi partition to /mnt/boot

pacstrap -i /mnt base base-devel
genfstab -U /mnt > /mnt/etc/fstab

# copy this scripts to the system so you have them available for execution inside the chroot
mkdir -p /mnt/tmp/archlinux-setup
cp -R *  /mnt/tmp/archlinux-setup

# chroot into it
arch-chroot /mnt /bin/bash
