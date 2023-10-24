local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local arrowr = { "", "", "", "", "", "⯈", "▶", "▷", "", "" }
local dashboard = require("alpha.themes.dashboard")
local tele_custom = "<cmd> lua require('user.telescope_customPickers')."

dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
	dashboard.button("s", "舘" .. arrowr[1] .. " Search sessions", tele_custom .. "possession()<CR>"),
	dashboard.button("f", " " .. " Find file", "<CMD>Telescope find_files <CR>"),
	-- dashboard.button("e", " " .. " New file", "<CMD>ene <BAR> startinsert <CR>"),
	dashboard.button(
		"p",
		" " .. " Find project",
		"<CMD>lua require('telescope').extensions.projects.projects()<CR>"
	),
	dashboard.button("r", " " .. " Recent files", "<CMD>Telescope oldfiles <CR>"),
	dashboard.button("t", " " .. " Find text", "<CMD>Telescope live_grep <CR>"),
	dashboard.button("ps", " " .. " Update plugins", "<CMD>Lazy sync<CR>"),
	dashboard.button("c", " " .. " Config", "<CMD>e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", " " .. " Quit", "<CMD>qa<CR>"),
}

local function footer()
	return "https://elvindesouza.github.io"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
