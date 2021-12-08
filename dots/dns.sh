https://download.dnscrypt.info/resolvers-list/v2/public-resolvers.md

Step 1 - Install and Configure dnscrypt-proxy

sudo su
pacman -S dnscrypt-proxy dnsmasq

cd /etc/dnscrypt-proxy/
vim dnscrypt-proxy.toml

server_names = ['ahadns-doh-nl', 'cs-bulgaria', 'comss.one', 'cs-czech', 'cs-hungary', 'cs-london', 'cs-madrid']

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

-----------------------------------------------------------
nmcli device wifi list
nmcli device wifi connect r2d2 password 
systemctl stop dnscrypt-proxy
systemctl stop dnsmasq.service

systemctl disable dnsmasq.service
systemctl disable dnscrypt-proxy

systemctl restart dnscrypt-proxy
systemctl restart dnsmasq.service

sudo systemctl disable openvpn-client@vpn.service
