to bootstrap gentoo system from linux we will use qemu.

*** creating image ***
to start with create 32G image like this
#dd if=/dev/zero of=gentoo.img bs=2024 count=$((32 * 1000000000 / 2048000000))

mkfs.ext4 gentoo.img
mkdir /mnt/gentoo && mount -o loop gentoo.img /mnt/gentoo
cd /mnt/gentoo && git clone https://github.com/good-code/bootstrap_gentoo.git
cd bootstrap_gentoo && sh ./install.sh


then use the build scripts to compleate system merge
