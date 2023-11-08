local status_ok, signature = pcall(require, "lsp_signature")
if not status_ok then
	return
end

local icons = require("user.icons")

local cfg = {
	hint_prefix = icons.diagnostics.Hint .. " ", -- Panda for parameter
	hint_scheme = "Comment",
	max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
	-- to view the hiding contents
	max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
	timer_interval = 300, -- default timer check interval set to lower value if you want to reduce latency
}

-- recommanded:
signature.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

-- You can also do this inside lsp on_attach
-- note: on_attach deprecated
-- require("lsp_signature").on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key
signature.on_attach(cfg) -- no need to specify bufnr if you don't use toggle_key
