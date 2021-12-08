#!/usr/bin/env bash
# Time 
sudo timedatectl set-local-rtc 1 --adjust-system-clock

# CODE
cd 
sudo vim /usr/lib/code/product.json 
"extensionsGallery": {
    "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
    "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
    "itemUrl": "https://marketplace.visualstudio.com/items"
}

------------------------------------------------------------
#Bash and ZSH
ln -sf ~/box/shell/.bashrc ~/.bashrc
ln -sf ~/box/shell/.zshrc ~/.zshrc
------------------------------------------------------------
# DNS
Step 1 - Install and Configure dnscrypt-proxy

sudo su
pacman -S dnscrypt-proxy dnsmasq

cd /etc/dnscrypt-proxy/
vim dnscrypt-proxy.toml

server_names = ['meganerd', 'serbica', 'cs-nl2']
server_names = ['cs-nl', 'meganerd', 'cs-nl2', 'serbica']
server_names = ['cs-nl', 'meganerd', 'cs-nl2']
server_names = ['ahadns-doh-nl', 'meganerd', 'cs-nl2']

listen_addresses = ['127.0.0.1:53000', '[::1]:53000']
cache = true

systemctl start dnscrypt-proxy
systemctl enable dnscrypt-proxy

Step 2 - Install and Configure Dnsmasq

pacman -S dnsmasq
vim /etc/dnsmasq.conf

no-resolv
server=::1#53000
server=127.0.0.1#53000
listen-address=::1,127.0.0.1
conf-file=/usr/share/dnsmasq/trust-anchors.conf
dnssec

systemctl start dnsmasq
systemctl enable dnsmasq

vim /etc/resolv.conf

nameserver ::1
nameserver 127.0.0.1
options edns0 single-request-reopen

chattr +i /etc/resolv.conf

systemctl restart NetworkManager

------------------------------------------------------------
# Ruby and RVM
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
\curl -sSL https://get.rvm.io | bash -s stable --rails

------------------------------------------------------------
# Bluetooth 
lsmod | grep btusb
sudo vim /etc/bluetooth/main.conf

/AutoEnable=true

sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

------------------------------------------------------------


sudo su
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
ln -sf ~/box/shell/.zshrc ~/.zshrc
------------------------------------------------------------
# LightDM
sudo rm -r /etc/lightdm/lightdm.conf /etc/lightdm/lightdm-mini-greeter.conf
sudo cp ~/box/lightdm/lightdm-mini-greeter.conf /etc/lightdm
sudo cp ~/box/lightdm/lightdm.conf /etc/lightdm

sudo systemctl enable lightdm.service --no-pager
sudo systemctl status lightdm.service --no-pager
sudo systemctl start lightdm.service --no-pager
