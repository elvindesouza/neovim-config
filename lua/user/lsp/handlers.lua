local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

-- https://neovim.io/doc/user/lsp.html
-- Full list of features
-- https://neovim.io/doc/user/lsp.html#lsp-buf

M.setup = function()
	local config = {
		virtual_text = true, -- disable virtual text showing errors off to the right
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.HINT] = "",
				[vim.diagnostic.severity.INFO] = "",
			},
			-- Highlight entire line for errors
			linehl = {
				[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			},
			-- Highlight the line number for warnings
			numhl = {
				[vim.diagnostic.severity.WARN] = "WarningMsg",
			},
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
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_keymaps(bufnr)
	local opts = {
		noremap = true,
		silent = true,
	}
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>Trouble lsp_definitions<CR>", opts)
	keymap(bufnr, "n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gI", "<cmd>Trouble lsp_implementations<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>Trouble lsp_references<CR>", opts)
	keymap(bufnr, "n", "<S-F12>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap(bufnr, "n", "<F6>", "<cmd>lua vim.lsp.buf.format({async=true})<cr>", opts)
	keymap(bufnr, "n", "<C-S-i>", "<cmd>lua vim.lsp.buf.format({async=true})<cr>", opts)
	keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
	keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
	keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<F8>", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<S-F8>", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	keymap(bufnr, "n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap(bufnr, "n", "<leader>lq", "<cmd>Trouble loclist<CR>", opts)
	keymap(bufnr, "n", "<leader>D", "<cmd>Trouble lsp_type_definitions<CR>", opts)
	keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps(bufnr)

	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end

	illuminate.on_attach(client)
end

return M
