local dressing_status_ok, dressing = pcall(require, "dressing")
if not dressing_status_ok then
    return
end

local t = 0
local b =  { tl = "🭽",  t = "▔", tr = "🭾",  r = "▕", br = "🭿",  b = "▁", bl = "🭼",  l = "▏", ml = "▏", mr = "▕" }
local bn = { tl = " ",  t = " ", tr = " ",  r = " ", br = " ",  b = " ", bl = " ",  l = " ", ml = " ", mr = " " }

dressing.setup({
	select = {
		-- Set to false to disable the vim.ui.select implementation
		enabled = true,

		-- Priority list of preferred vim.select implementations
		backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

		-- Options for telescope selector
		-- These are passed into the telescope picker directly. Can be used like:
		-- telescope = require('telescope.themes').get_ivy({...})
		telescope = require("telescope.themes").get_dropdown({
			previewer = false,
			results_title = false,
			layout_strategy = "vertical",
			layout_config = {
				prompt_position = "top",
				width = {
					0.6,
					min = 90,
					max = 110,
				},
				height = {
					0.5,
					min = 20,
					max = 40,
				},
			},
			borderchars = {
				--  prompt  = { "🬂",   "▐",   "🬭",   "▌",   "🬕",   "🬨",   "▐",   "▌"   }
				prompt = { b.t, b.r, bn.b, b.l, b.tl, b.tr, b.r, b.l },
				--  results = { "🬂",   "▐",   "🬭",   "▌",   "🬛",   "🬫",   "🬷",   "🬲"   },
				results = { b.t, b.r, b.b, b.l, b.tl, b.tr, b.br, b.bl },
				--  preview = { "🬂",   "▐",   "🬭",   "▌",   "🬕",   "🬨",   "🬷",   "🬲"   },
				preview = { b.t, b.r, bn.b, b.l, b.tl, b.tr, b.r, b.l },
			},
		}),
	},
})
