#!/bin/bash

echo "Downloading neovim nightly appimage"
rm -f nvim.appimage
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.appimage nvim.appimage
chmod +x nvim.appimage

echo "Optionally, run- sudo ln -s "$HOME"/.config/nvim/nvim.appimage /usr/bin/nvim"
