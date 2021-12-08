#!/usr/bin/env bash

# Rust 
echo "Installing RUST"
sudo pacman -S rustup cargo
rustup default stable
#curl -f https://sh.rustup.rs > rust.sh

# Ruby and RVM
echo "Installing RUBY"
sudo pacman -S ruby


echo "Installing PYTHON"
# Python and dependances
#yay -S python36 
#yay -S python37 
yay -S python38  
yay -S tk 
yay -S tcl

echo "Installing JAVA & Android"
# Java and Android
#yay -S android-studio
yay -S eclipse-java eclipse-jee


echo "Installing DOCKER"
# DOCKER
sudo pacman -S docker

