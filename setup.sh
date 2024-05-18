#!/bin/bash
cp -r config $XDG_CONFIG_HOME
cp vimrc ~/.vimrc
cp bashrc ~/.bashrc
cp gitconfig ~/.gitconfig

systemctl enable --user syncthing
