#!/bin/bash

rm vim.log
nvim --startuptime vim.log -c 'q'
bat vim.log
rm vim.log
