#! /bin/bash

# Drivers
# For AMD xf86-video-amdgpu
sudo pacman -S xf86-video-intel mesa nvidia nvidia-utils

# X
echo "Installing X-server..."
sudo pacman -S xorg xorg-xinit xorg-server xorg-xmodmap ctags pavucontrol pulseaudio alsa-lib i3-wm rofi arandr picom nitrogen lxappearance  xdg-user-dirs  

sleep 5

# Term Apps
echo "Installing apps..."
sudo pacman -S gvim neovim xterm ranger tmux zsh zsh-theme-powerlevel10k btop htop neofetch aerc cmus termshark ncdu profanity weechat mcabber calc viu lfs calcurse tree lsd onefetch tree-sitter luajit


sleep 5

# Apps
echo "Installing apps..."
sudo pacman -S alacritty terminator kitty nemo virtualbox code atom xed feh mpv pidgin element-desktop telegram-desktop xreader djvulibre flameshot peek transmission-gtk libreoffice-still firefox firefox-developer-edition filezilla discord nextcloud nextcloud-client bleachbit genius kcalc parley vlc obs-studio rhythmbox

sleep 5

# Utils
sudo pacman -S python-pip ueberzug python-poetry pyright rust-analyzer wget curl cmake make unrar unzip zip gcc yasm nasm pkg-config clang gtk3 xdotool libxcb libxfixes lsb-release yapf

sleep 5

# Theme & fonts
echo "Installing themes ans fonts..."
sudo pacman -S papirus-icon-theme materia-gtk-theme breeze-icons ttf-dejavu ttf-liberation  ttf-ubuntu-font-family ttf-droid noto-fonts xorg-fonts-misc ttf-fira-mono ttf-fira-code ttf-cascadia-code

sleep 5

# Bluetooth
sudo pacman -S bluez bluez-utils blueman

sleep 5

# Net-Tools
sudo pacman -S nmap wireshark-cli

# Network
echo "Installing network tools..."
sudo pacman -S wireguard-tools openvpn openresolv net-tools dnsutils stubby firewalld arch-audit iproute2 inetutils tor 
 
sleep 5


# Other

 
# UPDATE
sudo pacman -Syyy

cd ~

echo "Installing OH-MY-ZSH..."
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh 






