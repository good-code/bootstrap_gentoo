#!/bin/bash

wget -c http://www.mirrorservice.org/sites/distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64-hardened/stage3-amd64-hardened-20170406.tar.bz2
wget -c http://www.mirrorservice.org/sites/distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64-hardened/stage3-amd64-hardened-20170406.tar.bz2.DIGESTS

ck1=$(sha512sum stage3-amd64-hardened-20170406.tar.bz2)
ck2=$(openssl dgst -r -sha512 stage3-amd64-hardened-20170406.tar.bz2)

if ! [ ck1 == ck2 ]; then 
	echo "bad stage file!"
	exit -1
fi

tar xvjpf stage3-*.tar.bz2 --xattrs --numeric-owner
cp /etc/make.conf /mnt/gentoo/etc/
cp /etc/portage/repos.conf/gentoo.conf /etc/portage/repos.conf/gentoo.conf
mkdir -p etc/portage/repos.conf
cp /etc/resolv.conf /mnt/gentoo/etc/
mount -t proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --rbind /sys sys
mount --rbind /dev dev
chroot /mnt/gentoo
