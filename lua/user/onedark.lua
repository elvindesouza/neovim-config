local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
	return
end

onedark.setup({
	style = "darker",
	--italic, bold, underline, none
	ending_tildes = true,
	toggle_style_key = nil,
	code_style = {
		comments = "italic",
		keywords = "italic",
		functions = "none",
		strings = "none",
		variables = "none",
	},
	-- Custom Highlights --
	colors = {
		--[[ bg0 = "#000000", ]]
		--[[ bg1 = "#111111", ]]
		--[[ bg2 = "#222222", ]]
		--[[ bg3 = "#232323", ]]
		--[[ fg = "#ffffff", ]]
		--[[ black = "#000000", ]]
		--[[ blue = "#82AAFF", ]]

		---defaults below
		black = "#0e1013",
		bg0 = "#1f2329",
		bg1 = "#282c34",
		bg2 = "#30363f",
		bg3 = "#323641",
		bg_d = "#181b20",
		bg_blue = "#61afef",
		bg_yellow = "#e8c88c",
		fg = "#a0a8b7",
		purple = "#bf68d9",
		green = "#8ebd6b",
		orange = "#cc9057",
		--[[ blue = "#4fa6ed", ]]
		yellow = "#e2b86b",
		cyan = "#48b0bd",
		red = "#e55561",
		grey = "#535965",
		light_grey = "#7a818e",
		dark_cyan = "#266269",
		dark_red = "#8b3434",
		dark_yellow = "#835d1a",
		dark_purple = "#7e3992",
		diff_add = "#272e23",
		diff_delete = "#2d2223",
		diff_change = "#172a3a",
		diff_text = "#274964",
	}, -- Override default colors
	highlights = {
		TSOperator = { fg = "$purple" },
		TSPunctBracket = { fg = "$yellow" },
		TSFunction = { fg = "#82AAFF" },
		TSMethod = { fg = "#82AAFF" },
	}, -- Override highlight groups
})

onedark.load()
