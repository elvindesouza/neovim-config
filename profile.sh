#!/bin/bash

rm -f nvim.appimage
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod +x nvim.appimage

nvim --startuptime vim.log -c 'q'
batcat vim.log
rm vim.log

time zsh -i -c exit
