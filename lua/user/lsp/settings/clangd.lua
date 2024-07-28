return {
	settings = {
		clangd = function(_, opts)
			opts.capabilities.offsetEncoding = { "utf-16" }
		end,
	},
}
