local status_ok, symbols_outline = pcall(require, "symbols-outline")
if not status_ok then
	return
end

-- local icons = require("user.icons")

symbols_outline.setup()
