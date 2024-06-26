local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local previewers = require("telescope.previewers")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")
local finders = require("telescope.finders")
local themes = require("telescope.themes")
local conf = require("telescope.config").values
local icons = require("user.icons")

telescope.setup({
	defaults = {
		sorting_strategy = "ascending",
		prompt_prefix = icons.ui.Telescope,
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = {
			"yarn%.lock",
			"package%-lock%.json",
			".git/",
			"node_modules",
			"%.svg",
			"%.png",
			"%.jpeg",
			"%.jpg",
			"%.ico",
			"%.webp",
			"%.avif",
			"%.heic",
			"%.mp3",
			"%.mp4",
			"%.mkv",
			"%.mov",
			"%.wav",
			"%.flv",
			"%.avi",
			"%.webm",
			".env.*",
			"%.db",
			"_site/.*",
			"_next/.*",
			"dist/.*",
			"build/.*",
			"fonts/.*",
			"icons/.*",
			"images/.*",
			".env.*",
			".yarn/.*",
			".neuron/.*",
			"graphql%.schema%.json",
			"schema%.json",
		},

		mappings = {
			i = {
				["<Down>"] = actions.cycle_history_next,
				["<Up>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-c>"] = actions.close,
				["<Esc>"] = actions.close,
			},
		},
		layout_config = {
			prompt_position = "top",
			horizontal = {
				mirror = true,
				preview_cutoff = 100,
				preview_width = 0.5,
			},
			vertical = {
				--[[ mirror = true, ]]
				preview_cutoff = 0.5,
			},
			flex = {
				flip_columns = 110,
			},
			height = 0.94,
			width = 0.86,
		},
	},
})
