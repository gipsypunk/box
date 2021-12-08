#!/usr/bin/env bash
#systemctl list-unit-files
#systemd dhcpcd
#sudo cp ~/box/resolv.conf /etc/
#sudo chattr +i /etc/resolv.conf
#=======================
#sudo systemctl disable  openvpn-client@vpn.service 
#sudo systemctl stop  openvpn-client@vpn.service 
#sudo systemctl restart  openvpn-client@vpn.service 
#sudo systemctl  restart dnscrypt-proxy
#sudo systemctl restart dnsmasq

#sudo systemctl status Networkmanager.service
#sudo systemctl status dnscrypt-proxy
#sudo systemctl status dnsmasq
#sudo systemctl status openvpn-client@vpn.service 
#sudo systemctl disable firewalld
#===============================================================
#sudo systemctl enable dnsmasq.service --no-pager
#sudo systemctl start dnsmasq.service --no-pager

#================================================================
# OpenVPN 
echo "Installing OPENVPN..."
sudo ls -l /etc/openvpn/client/
sudo cp ~/box/vpn/vpn.ovpn /etc/openvpn/client/vpn.conf
sudo cp ~/box/vpn/.secrets /etc/openvpn/client/.secrets

sudo systemctl enable openvpn-client@vpn.service --no-pager
sudo systemctl start openvpn-client@vpn.service --no-pager
sudo systemctl status openvpn-client@vpn.service --no-pager
sudo systemctl restart openvpn-client@vpn.service 


#===============================================================
# Firewall
#sudo systemctl start firewalld --no-pager
#sudo systemctl enable firewalld --no-pager
#sudo systemctl status firewalld --no-pager
#sudo firewall-config



