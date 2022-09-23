local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local navic = require("nvim-navic")

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	always_visible = false,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = "", modified = "", removed = "" }, -- changes diff symbols
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icons_enabled = true,
}

local hide_in_width_100 = function()
	return vim.o.columns > 100
end

local current_signature = {
	function()
		local buf_ft = vim.bo.filetype

		if buf_ft == "toggleterm" or buf_ft == "TelescopePrompt" then
			return ""
		end
		if not pcall(require, "lsp_signature") then
			return ""
		end
		local sig = require("lsp_signature").status_line(5)
		local hint = sig.hint

		if not require("user.functions").isempty(hint) then
			return sig.label .. "🐼" .. hint
		end

		return ""
	end,
	--[[ cond = hide_in_width_100, ]]
	padding = 0,
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end
--
lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "auto",
		--[[ component_separators = { left = "", right = "" }, ]]
		--[[ section_separators = { left = "", right = "" }, ]]
		--[[ component_separators = "|", ]]
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 0 },
		},
		lualine_b = { current_signature },
		lualine_c = { diagnostics },
		lualine_x = { { navic.get_location, cond = navic.is_available } },
		lualine_y = {},
		--[[ lualine_ diffz = { "progress" }, ]]
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 0 },
		},
	},
})
