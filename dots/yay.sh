#! /bin/bash

# YAY
echo "Installing YAY..."
cd ~/.config
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~



echo "Installing YAY APPS"
# Apps
yay -S polybar-git
yay -S cpod-git
yay -S xcursor-breeze
yay -S betterlockscreen
yay -S rpi-imager
yay -S cointop






    

echo "Installing YAY FONTS"
# Fonts
yay -S ttf-unifont nerd-fonts 
yay -S nerd-fonts-dejavu-complete
yay -S ttf-dejavu-sans-mono-powerline-git 
yay -S nerd-fonts-hermit 
yay -S otf-droid-sans-mono-powerline-git




echo "Installing OTHER APPS"
#Joplin
echo "Installing Joplin..."
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

# UPDATE
sudo pacman -Syyy



