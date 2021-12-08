#! /bin/bash

sudo -i 

cp /home/user/box/wg0.conf ~/etc/wireguard

wg-quick up wg0
systemctl enable wg-quick@wg0 --no-pager
systemctl status wg-quick@pc --no-pager
