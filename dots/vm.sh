#!/usr/bin/env bash


sudo pacman -S qemu virt-manager virt-viewer vde2 bridge-utils openbsd-netcat dmidecode libguestfs

sudo pacman -S ovmf ebtables
#ebtables nftables 



sudo systemctl enable libvirtd.service --no-pager
sudo systemctl start libvirtd.service --no-pager
sudo systemctl restart libvirtd.service --no-pager
sudo systemctl status libvirtd.service --no-pager



sudo usermod -a -G libvirt $(whoami)
newgrp libvirt

sudo modprobe -r kvm_intel
sudo modprobe kvm_intel nested=1
echo "options kvm-intel nested=1" | sudo tee /etc/modprobe.d/kvm-intel.conf

systool -m kvm_intel -v | grep nested
cat /sys/module/kvm_intel/parameters/nested 

sudo systemctl restart libvirtd.service --no-pager
