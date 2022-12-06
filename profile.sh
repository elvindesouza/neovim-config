#!/bin/bash

rm -f nvim.appimage
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod +x nvim.appimage

rm vim.log
nvim --startuptime vim.log -c 'q'
bat vim.log
rm vim.log

time zsh -i -c exit
