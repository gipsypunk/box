#! /bin/bash

# VIM  
mkdir ~/.vim

# .vimrc
echo "Creating .vimrc file..."
ln -sf  ~/box/vim/.vimrc ~/



# VimPlug
echo "Installing VimPlug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing plugins..."
vim -es -u ~/.vimrc -i NONE -c "PlugInstall" -c "qa"




echo "Installing YouCompleteMe..."
cd  ~/.vim/plugged/YouCompleteMe
./install.py
cd ~


# Colors and themes
echo "Installing themes and colors..."

cp -r ~/box/vim/colors/ ~/.vim
cp  ~/box/vim/colors/my.vim ~/.vim/plugged/lightline.vim/autoload/lightline/colorscheme/



#ln -sf  ~/box/.vim/colors/ ~/.config/.vim/colors
#----------------------------------------------------
#OH-MY-TMUX
echo "Installing OH-MY-TMUX..."
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf 
ln -sf ~/box/tmux/.tmux.conf.local ~/.tmux.conf.local
tmux source ~/.tmux.conf.local
tmux source ~/.tmux.conf

#Bash and ZSH
ln -sf ~/box/shell/.bashrc ~/.bashrc
ln -sf ~/box/shell/.zshrc ~/.zshrc

# i3wm 
ln -sf ~/box/i3/ ~/.config/i3

# Betterlockscreen
ln -sf ~/box/betterlockscreen/betterlockscreenrc ~/.config/

# Picom
ln -sf ~/box/picom/ ~/.config/picom
#picom --config ~/box/picom/picom.conf

# Polybar
chmod +x ~/box/polybar/scripts/launch.sh 
ln -sf ~/box/polybar/ ~/.config/polybar

# Rofi
ln -sf ~/box/rofi/ ~/.config/rofi
sudo cp -f ~/box/rofi/launchpad.rasi  /usr/share/rofi/themes/


# X-files
#sudo cp /etc/X11/xinit/xinitrc ~/.xinitrc
#sudo chown user:user ~/.xinitrc 
#xrdb  ~/box/X-files/.Xresources
#xmodmap ~/box/X-files/.Xmodmap
ln -sf ~/box/x-files/.xinitrc ~/.xinitrc 
ln -sf ~/box/x-files/.Xresources ~/.Xresources
ln -sf ~/box/x-files/.Xmodmap ~/.Xmodmap

# SSH
ln -sf ~/box/.ssh ~/.ssh
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
sudo chmod 644 ~/.ssh/known_hosts
sudo chmod 755 ~/.ssh


# NEOVIM
ln -sf ~/box/nvim/ ~/.config/nvim

# Alacritty
ln -sf ~/box/alacritty/ ~/.config/alacritty

#Kitty
ln -sf ~/box/kitty/ ~/.config/kitty

# Terminator
ln -sf ~/box/terminator/ ~/.config/terminator

# Ranger
ln -sf  ~/box/ranger/ ~/.config/ranger

# Wallpapers
ln -sf ~/box/wallpapers ~/.config/wallpapers

xdg-settings set default-web-browser firefox.desktop

# Python poetry
cd ~
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry


