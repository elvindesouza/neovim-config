local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local servers = {
	"cssls",
	"html",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
	"awk_ls",
	"bashls",
	"clangd",
	"eslint",
	"jsonls",
	"vimls",
	"lua_ls",
	"jdtls",
	--[[ "groovyls", ]]
	"asm_lsp",
	"marksman",
	"intelephense",
	"sqls",

	--[[ "actionlint", ]]
	--[[ "asm-lsp", ]]
	--[[ "awk-language-server", ]]
	--[[ "bash-debug-adapter", ]]
	--[[ "bash-language-server", ]]
	--[[ "beautysh", ]]
	--[[ "black", ]]
	--[[ "cbfmt", ]]
	--[[ "chrome-debug-adapter", ]]
	--[[ "clangd", ]]
	--[[ "cmake-language-server", ]]
	--[[ "cmakelang", ]]
	--[[ "codespell", ]]
	--[[ "cpplint", ]]
	--[[ "cpptools", ]]
	--[[ "cspell", ]]
	--[[ "css-lsp", ]]
	--[[ "curlylint", ]]
	--[[ "debugpy", ]]
	--[[ "djlint", ]]
	--[[ "emmet-ls", ]]
	--[[ "eslint-lsp", ]]
	--[[ "firefox-debug-adapter", ]]
	--[[ "fixjson", ]]
	--[[ "flake8", ]]
	--[[ "html-lsp", ]]
	--[[ "impl", ]]
	--[[ "intelephense", ]]
	--[[ "isort", ]]
	--[[ "jdtls", ]]
	--[[ "js-debug-adapter", ]]
	--[[ "json-lsp", ]]
	--[[ "lua-language-server", ]]
	--[[ "luacheck", ]]
	--[[ "luau-lsp", ]]
	--[[ "marksman", ]]
	--[[ "mypy", ]]
	--[[ "php-debug-adapter", ]]
	--[[ "prettier", ]]
	--[[ "proselint", ]]
	--[[ "pylint", ]]
	--[[ "pyright", ]]
	--[[ "shellcheck", ]]
	--[[ "shellharden", ]]
	--[[ "shfmt", ]]
	--[[ "sql-formatter", ]]
	--[[ "sqlfluff", ]]
	--[[ "sqlls", ]]
	--[[ "sqls", ]]
	--[[ "stylua", ]]
	--[[ "textlint", ]]
	--[[ "typescript-language-server", ]]
	--[[ "usort", ]]
	--[[ "vim-language-server", ]]
	--[[ "vint", ]]
	--[[ "write-good", ]]
	--[[ "xmlformatter", ]]
	--[[ "yaml-language-server", ]]
	--[[ "yamlfmt", ]]
	--[[ "yamllint", ]]
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

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server == "sumneko_lua" then
		local sumneko_opts = require("user.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "pyright" then
		local pyright_opts = require("user.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "awk_ls" then
		local awk_opts = require("user.lsp.settings.awk_ls")
		opts = vim.tbl_deep_extend("force", awk_opts, opts)
	end
	lspconfig[server].setup(opts)
end
