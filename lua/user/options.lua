local opt = vim.opt
local cmd = vim.cmd

opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
--opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.pumheight = 10 -- pop up menu height
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 0 -- always show tabs
opt.smartcase = true -- smart case
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 600 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 300 -- faster completion (4000ms default)
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
opt.tabstop = 4 -- insert 2 spaces for a tab
opt.cursorline = true -- highlight the current line
opt.number = false -- set numbered lines
opt.laststatus = 3
opt.showcmd = false
opt.ruler = false
opt.numberwidth = 2 -- set number column width to 2 {default 4}
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false -- display lines as one long line
opt.scrolloff = 8 -- is one of my fav
opt.sidescrolloff = 8
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.fillchars.eob = " "
opt.shortmess:append("c")
opt.whichwrap:append("<,>,[,],h,l")
opt.iskeyword:append("-")
opt.compatible = false
opt.incsearch = true
opt.autoindent = true
opt.cindent = true
opt.so = 7
opt.virtualedit:append("onemore")
opt.showmatch = true
opt.fileformat = "unix"
cmd("syntax enable")
cmd("syntax on")
cmd("filetype plugin on")
cmd("filetype indent on")
cmd("set backspace=eol,start,indent")
cmd("set ffs=unix,dos,mac")
opt.inccommand = "split"
cmd("set guifont=Iosevka_Nerd_Font_Mono:h28")

if vim.version().minor > 7 then
	opt.cmdheight = 0
end
