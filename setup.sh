#!/bin/sh
mkdir -p $XDG_CONFIG_HOME && cp -r config/* $XDG_CONFIG_HOME/
mkdir -p $XDG_BIN_HOME && cp -r bin/* $XDG_BIN_HOME/
cp vimrc ~/.vimrc
cp bashrc ~/.bashrc
cp gitconfig ~/.gitconfig

systemctl enable --user syncthing

flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --noninteractive --user flathub md.obsidian.Obsidian
flatpak install --noninteractive --user flathub com.spotify.Client
flatpak install --noninteractive --user flathub com.discordapp.Discord
