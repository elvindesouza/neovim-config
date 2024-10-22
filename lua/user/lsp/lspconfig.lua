local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local servers = {
	"pyright",
	"cssls",
	"html",
	"ts_ls",
	"bashls",
	"jsonls",
	"bashls",
	"clangd",
	"eslint",
	"jsonls",
	"vimls",
	"lua_ls",
	"marksman",
	"sqlls",

	-- "yamlls",
    -- "texlab",
	-- "jdtls",
	-- "intelephense",
	-- "awk_ls",
	-- "groovyls", 
	-- "asm_lsp",
	-- "actionlint",
	-- "asm-lsp",
	-- "awk-language-server",
	-- "bash-debug-adapter",
	-- "bash-language-server",
	-- "beautysh",
	-- "black",
	-- "cbfmt",
	-- "chrome-debug-adapter",
	-- "cmake-language-server",
	-- "cmakelang",
	-- "codespell",
	-- "cpplint",
	-- "cpptools",
	-- "cspell",
	-- "css-lsp",
	-- "curlylint",
	-- "debugpy",
	-- "djlint",
	-- "emmet-ls",
	-- "eslint-lsp",
	-- "firefox-debug-adapter",
	-- "fixjson",
	-- "flake8",
	-- "html-lsp",
	-- "impl",
	-- "intelephense",
	-- "isort",
	-- "jdtls",
	-- "js-debug-adapter",
	-- "json-lsp",
	-- "lua-language-server",
	-- "luacheck",
	-- "luau-lsp",
	-- "marksman",
	-- "mypy",
	-- "php-debug-adapter",
	-- "prettier",
	-- "proselint",
	-- "pylint",
	-- "shellcheck",
	-- "shellharden",
	-- "shfmt",
	-- "sql-formatter",
	-- "sqlfluff",
	-- "sqlls",
	-- "sqls",
	-- "stylua",
	-- "textlint",
	-- "typescript-language-server",
	-- "usort",
	-- "vim-language-server",
	-- "vint",
	-- "write-good",
	-- "xmlformatter",
	-- "yaml-language-server",
	-- "yamlfmt",
	-- "yamllint",
}

-- Mason-lspconfig setup done here
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server == "pyright" then
		local pyright_opts = require("user.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "awk_ls" then
		local awk_opts = require("user.lsp.settings.awk_ls")
		opts = vim.tbl_deep_extend("force", awk_opts, opts)
	end

	if server == "lua_ls" then
		local lua_opts = require("user.lsp.settings.lua_ls")
		opts = vim.tbl_deep_extend("force", lua_opts, opts)
	end

	if server == "clangd" then
		local clangd_opts = require("user.lsp.settings.clangd")
		opts = vim.tbl_deep_extend("force", clangd_opts, opts)
	end

	lspconfig[server].setup(opts)
end
