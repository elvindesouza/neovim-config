-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/lualine.lua
-- TODO yoink his nice lualine config
--
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 50
end

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

local hide_in_width_50 = function()
	return vim.o.columns > 50
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
		local icon = require("user.icons").diagnostics.Hint

		if not require("user.functions").isempty(hint) then
			return sig.label .. icon .. hint
		end

		return ""
	end,
	cond = hide_in_width_50,
	padding = 0,
}

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
		lualine_b = { "branch", diff, diagnostics },
		lualine_c = { current_signature },
		lualine_x = {filetype},
		lualine_y = {"progress"},
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 0 },
		},
	},
})
