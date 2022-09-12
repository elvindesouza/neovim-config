local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
	return
end

onedark.setup({
	style = "darker",
	--italic, bold, underline, none
    ending_tildes=true,
	code_style = {
		comments = "italic",
		keywords = "italic",
		functions = "none",
		strings = "none",
		variables = "none",
	},
	-- Custom Highlights --
	colors = {
		bg0 = "#000000",
		fg = "#ffffff",
		black = "#000000",
		blue = "#82AAFF",
	}, -- Override default colors
	highlights = {
		TSOperator = { fg = "$purple" },
		TSPunctBracket = { fg = "$yellow" },
	}, -- Override highlight groups
})
onedark.load()
