#! /bin/bash

echo 46f035c31d758c077cce8f16cf9381e8def937bb strap.sh | sha1sum -c
chmod +x strap.sh
sudo ./strap.sh



sudo pacman -S blackarch-<category>
#sudo pacman -S sn0int nmap wireshark-qt nikto john hcxtools hcxkeys ettercap  	bettercap aircrack-ng hashcat medusa sqlmap lynis wpscan hydra blue-hydra fluxion
