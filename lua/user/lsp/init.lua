local M = {}

-- Base capabilities, extended by cmp-nvim-lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

vim.lsp.config("*", {
	capabilities = capabilities,
})

local servers = { "pyright", "cssls", "html", "ts_ls", "bashls", "jsonls", "clangd", "eslint", "vimls", "lua_ls" }

for _, server in ipairs(servers) do
	local ok, opts = pcall(require, "user.lsp.settings." .. server)
	if ok then
		vim.lsp.config(server, opts)
	end
end

vim.lsp.enable(servers)

-- Diagnostics / floating window UI
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
		linehl = { [vim.diagnostic.severity.ERROR] = "ErrorMsg" },
		numhl = { [vim.diagnostic.severity.WARN] = "WarningMsg" },
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.o.winborder = "rounded" -- rounded borders on hover/signature-help floats, replaces vim.lsp.with()

-- Keymaps + on_attach behavior
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
	callback = function(ev)
		local bufnr = ev.buf
		local opts = { buffer = bufnr, silent = true, noremap = true }
		local keymap = vim.keymap.set

		-- VSCode-style bindings
		keymap("n", "<C-.>", "<cmd>Trouble quickfix<cr>", opts)
		keymap("n", "<S-F12>", "<cmd>Trouble lsp_references<CR>", opts)
		keymap("n", "<F12>", "<cmd>Trouble lsp_definitions<CR>", opts)
		keymap("n", "<C-S-i>", function() vim.lsp.buf.format({ async = true }) end, opts)
		keymap("n", "<F2>", vim.lsp.buf.rename, opts)
		keymap("n", "<F8>", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
		keymap("n", "<S-F8>", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
		keymap("n", "<C-S-m>", "<cmd>Trouble diagnostics<CR>", opts)

		keymap("n", "gD", vim.lsp.buf.declaration, opts)
		keymap("n", "gd", "<cmd>Trouble lsp_definitions<CR>", opts)
		keymap("n", "K", vim.lsp.buf.hover, opts)
		keymap("n", "gI", "<cmd>Trouble lsp_implementations<CR>", opts)
		keymap("n", "gr", "<cmd>Trouble lsp_references<CR>", opts)
		keymap("n", "gl", vim.diagnostic.open_float, opts)
		keymap("n", "<leader>la", vim.lsp.buf.code_action, opts)
		keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		keymap("n", "<leader>gs", vim.lsp.buf.signature_help, opts)
		keymap("n", "<leader>lq", "<cmd>Trouble loclist<CR>", opts)
		keymap("n", "<leader>D", "<cmd>Trouble lsp_type_definitions<CR>", opts)

		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

		local ok_ill, illuminate = pcall(require, "vim-illuminate")
		if ok_ill then
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			if client then
				illuminate.on_attach(client)
			end
		end
	end,
})

return M
