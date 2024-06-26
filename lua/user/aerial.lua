-- not being used
local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
	return
end

aerial.setup({
	-- Priority list of preferred backends for aerial.
	-- This can be a filetype map (see :help aerial-filetype-map)
	backends = { "lsp", "treesitter" }, -- putting treesitter first doesn't see variables etc.

	-- A list of all symbols to display. Set to false to display all symbols.
	-- This can be a filetype map (see :help aerial-filetype-map)
	-- To see all available values, see :help SymbolKind
	filter_kind = {
		"Class",
		"Constructor",
		"Enum",
		"Function",
		"Interface",
		"Module",
		"Method",
		"Struct",
	},

	-- Show box drawing characters for the tree hierarchy
	show_guides = true,

	on_attach = function(bufnr)
		-- Toggle the aerial window with <leader>a
		vim.keymap.set("n", "<C-t>", "<cmd>AerialToggle!<CR>", { buffer = bufnr })
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		-- Jump up the tree with '[[' or ']]'
		vim.keymap.set("n", "[[", "<cmd>AerialPrevUp<CR>", { buffer = bufnr })
		vim.keymap.set("n", "]]", "<cmd>AerialNextUp<CR>", { buffer = bufnr })
	end,
})
