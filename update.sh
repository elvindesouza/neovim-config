#!/bin/bash

echo "Downloading neovim nightly appimage"
rm -f "$HOME"/.config/nvim/nvim.appimage
wget -q --show-progress -O "$HOME"/.config/nvim/nvim.appimage "https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage"
chmod +x "$HOME"/.config/nvim/nvim.appimage

echo "Optionally, run- sudo ln -s "$HOME"/.config/nvim/nvim.appimage /usr/bin/nvim"
