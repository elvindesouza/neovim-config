local status_ok, neodev = pcall(require, "neodev")

if status_ok then
	neodev.setup({
		-- add any options here, or leave empty to use the default settings
	})
end

return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					library = vim.api.nvim_get_runtime_file("", true),
					--[[ [vim.fn.expand("$VIMRUNTIME/lua")] = true, ]]
					--[[ [vim.fn.stdpath("config") .. "/lua"] = true, ]]
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
