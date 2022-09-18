local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end

-- you can configure Hop the way you like here; see :h hop-config
hop.setup({ keys = "etovxqpdygfblzhckisuran" })

-- Shorten function name
-- Silent keymap option
local opts = { silent = true, noremap = true }

-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap(
	"",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"",
	"t",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"",
	"T",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
	opts
)

vim.api.nvim_set_keymap("n", "<leader>w", "<cmd>HopWordMW<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>HopLineStartMW<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>/", "<cmd>HopAnywhereMW<cr>", opts)
