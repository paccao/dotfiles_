#!/bin/bash

## This script is a modification of Chris Titus script, https://github.com/ChrisTitusTech/Debian-titus/blob/main/install.sh

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list

username=$(id -u -n 1000)
builddir=$(pwd)

# Update packages list and update system
apt update
apt upgrade -y

# Install nala
apt install nala -y

# Making .config and Moving config files and background to Pictures
cd $builddir
mkdir -p /home/$username/.config
mkdir -p /home/$username/.fonts
mkdir -p /home/$username/Pictures/Backgrounds
mkdir -p /usr/share/sddm/themes
cp .Xresources /home/$username
cp -R config/* /home/$username/.config/
cp -R Backgrounds /home/$username/Pictures/
mv user-dirs.dirs /home/$username/.config
chown -R $username:$username /home/$username
tar -xzvf sugar-candy.tar.gz -C /usr/share/sddm/themes
mv /home/$username/.config/sddm.conf /etc/sddm.conf

# Installing sugar-candy dependencies
nala install libqt5svg5 qml-module-qtquick-controls qml-module-qtquick-controls2 -y
# Installing Essential Programs
nala install feh i3 sxhkd urxvt rofi i3status picom thunar nitrogen lxpolkit x11-xserver-utils unzip yad wget pulseaudio pulseeffects pavucontrol vim tmux -y
