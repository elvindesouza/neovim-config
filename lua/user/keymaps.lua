-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true, noremap = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("c", "jk", "<C-c>", opts)

-- Visual --
-- Stay in indent mode
--indent with >, <
--In insert mode, Ctrl-T indents the current line, and Ctrl-D unindents.
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", ">", ">>", opts)
keymap("n", "<", "<<", opts)
keymap("n", "<Tab>", ">>_", opts)
keymap("n", "<S-Tab>", "<<_", opts)
keymap("i", "<S-Tab>", "<C-D>", opts)
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)

-- Plugins --

-- Telescope
keymap("n", "<C-p>", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>fm", ":Telescope marks<CR>", opts)
keymap("n", "<leader>f/", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>O", ":Telescope lsp_document_symbols<CR>", opts)
keymap("n", "<C-S-o>", ":Telescope lsp_document_symbols<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<C-\\>", "<cmd>ToggleTerm<CR>", opts)
keymap("t", "<C-\\>", "<cmd>ToggleTerm<CR>", opts)


-- Comment
--[[ keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts) ]]
--[[ keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").locked("comment.linewise")(vim.fn.visualmode())<CR>') ]]
--[[ keymap("n", "", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts) ]]
--[[ keymap("x", "", "<ESC><CMD>lua require('Comment.api').locked('comment.linewise')(vim.fn.visualmode())<CR>") ]]
--[[ keymap("i", "", "<ESC><CMD>lua require('Comment.api').locked('comment.linewise')(vim.fn.visualmode())<CR>") ]]
keymap("n", "<c-/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", opts)
keymap("i", "<c-/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", opts)
keymap("v", "<c-/>", "<cmd>lua require('Comment.api').toggle.blockwise.current()<cr>", opts)
-- Using line comments even when block of lines is selected
-- keymap("x", "<c-/>", "<esc><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<cr>", opts)
keymap("x", "<c-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)

-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- keymap("n", "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<F23>", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
--
keymap("n", "<C-o>", "<cmd>Telescope treesitter <cr>", opts)

--open up new line in insert mode
--[[ keymap("i", "oo", "<ESC>o", opts) ]]
--enter for newline
keymap("n", "<CR>", "o<Esc>", opts)

--delete previous word
keymap("i", "<C-BS>", "<C-w>", opts)
keymap("n", "<C-BS>", "db", opts)
--[[ keymap("i", "", "", opts) ]]
--[[ keymap("i", "", "", opts) ]]

--delete next word
keymap("i", "<C-Del>", "<C-o>dw", opts)
keymap("n", "<C-Del>", "dw", opts)

--R for redo
keymap("n", "R", "<C-R>", opts)

--seek to B/EOL
keymap("n", "0", "^", opts)
keymap("v", "0", "^", opts)
keymap("n", "-", "g$", opts)
keymap("v", "-", "g_", opts)
-- insert seek to B/EOL
keymap("i", "kl", "<ESC>g$i", opts)
keymap("i", "kj", "<ESC>^i")
-- insert jump to next line
keymap("i", "<C-o>", "<ESC>o", opts)

-- Move up/down editor lines
keymap("n", "j", "gjzz", opts)
keymap("n", "k", "gkzz", opts)

-- Move text up and down
--nnoremap j :m .+1<CR>==
--alt+nav keys to move lines of text around
--nnoremap k :m .-2<CR>==
--vnoremap j :m '>+1<CR>gv=gv
--vnoremap k :m '<-2<CR>gv=gv
-- working on archlinux
keymap("n", "<M-j>", "mz:m+<cr>`z", opts)
keymap("n", "<M-k>", "mz:m-2<cr>`z", opts)
keymap("v", "<M-j>", ":m'>+<cr>`<my`>mzgv`yo`z", opts)
keymap("v", "<M-k>", ":m'<-2<cr>`>my`<mzgv`yo`z", opts)

-- Move text up and down(not working well)
--keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
--keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

keymap("n", "<F1>", ":")
keymap("n", ";", ":")

keymap("n", "<M-z>", "<CMD>set wrap!<CR>", opts)


-- keymap("n", "<C-k>z", "<CMD>TZMinimalist<CR><CMD>lua vim.opt.cmdheight=0<CR>", opts)

keymap("n", "<a-n>", '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', opts)
keymap("n", "<a-p>", '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', opts)

-- place this in one of your configuration file(s)
keymap(
	"",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	opts
)
keymap(
	"",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	opts
)
keymap(
	"",
	"t",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
	opts
)
keymap(
	"",
	"T",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
	opts
)

keymap("n", "<leader>w", "<cmd>HopWordMW<cr>", opts)
keymap("n", "<leader>j", "<cmd>HopLineStartMW<cr>", opts)
keymap("n", "<leader>*", "<cmd>HopAnywhereMW<cr>", opts)
keymap("n", "<leader>/", "<cmd>HopPattern<cr>", opts)

-- Trouble
keymap("n", "M", "<CMD>TroubleToggle<CR>", opts)
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)

-- Alt keys in insert mode to move around
keymap("i", "<M-h>", "<C-o>h", opts)
keymap("i", "<M-l>", "<C-o>l", opts)
keymap("i", "<M-j>", "<C-o>j", opts)
keymap("i", "<M-k>", "<C-o>k", opts)

--
--[[ keymap("n", "U", "<cmd><cr>", opts) ]]

keymap("n", "|", "<cmd>vsplit<cr>", opts)
keymap("n", "_", "<cmd>split<cr>", opts)

keymap("n", "<M-C-N>", "<cmd>RunFile<cr>", opts)

-- toggle line numbers
keymap("n", "<leader>n", "<cmd>set nu!<cr>", opts)

vim.keymap.set('i', '<C-p>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<cr>", opts)

