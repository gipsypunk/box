#! /bin/bash

# X
echo "Installing X-server..."
sudo pacman -S xorg xorg-xinit xorg-server xorg-xmodmap xf86-video-intel ctags pavucontrol pulseaudio python-pip python-poetry
	 


# Apps
echo "Installing apps..."
sudo pacman -S i3-wm rofi xdg-user-dirs lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings arandr gvim xterm ranger tmux zsh w3m alacritty terminator nemo atom xed nitrogen lxappearance picom feh mpv htop pidgin xreader flameshot firefox-developer-edition unrar wget curl neofetch unzip cmake gcc yasm nasm zip make pkg-config clang gtk3 xdotool libxcb libxfixes alsa-lib filezilla lsb-release nmap 

# Bluetooth
sudo pacman -S bluez bluez-utils blueman

# Net-Tools
echo "Installing network tools..."
sudo pacman -S net-tools dnsutils firewalld openvpn arch-audit iproute2

# Theme & fonts

echo "Installing themes ans fonts..."
sudo pacman -S materia-gtk-theme papirus-icon-theme ttf-dejavu ttf-liberation  ttf-ubuntu-font-family ttf-droid noto-fonts xorg-fonts-misc ttf-fira-mono 




# YAY
echo "Installing YAY..."
cd ~/.config
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

# Apps
echo "Installing YAY APPS"
yay -S polybar-git
yay -S xcursor-breeze
yay -S vscodium-bin


# Fonts
echo "Installing YAY FONTS"
yay -S ttf-font-awesome-4 
yay -S ttf-unifont nerd-fonts 
yay -S nerd-fonts-dejavu-complete
yay -S ttf-dejavu-sans-mono-powerline-git 
yay -S lightdm-mini-greeter-git freetube-bin  
yay -S nerd-fonts-hermit 
yay -S otf-droid-sans-mono-powerline-git





sudo yay -Syu
sudo pacman -Syu

