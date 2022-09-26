local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		--mode = "tabs",
		close_command = "Bdelete %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete %d", -- can be a string | function, see "Mouse actions"
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
		tab_size = 10,
		max_name_length = 15,
		max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		autosize = true,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		show_buffer_close_icons = false,
		show_tab_indicators = true,
	},

	highlights = {
		fill = {
			fg = { attribute = "fg", highlight = "#ff0000" },
			bg = { attribute = "bg", highlight = "Black" },
		},
		background = {
			fg = { attribute = "fg", highlight = "Black" },
			bg = { attribute = "bg", highlight = "Black" },
		},

		buffer_visible = {
			fg = { attribute = "fg", highlight = "Black" },
			bg = { attribute = "bg", highlight = "Black" },
		},

		close_button = {
			fg = { attribute = "fg", highlight = "Black" },
			bg = { attribute = "bg", highlight = "Black" },
		},
		close_button_visible = {
			fg = { attribute = "fg", highlight = "Black" },
			bg = { attribute = "bg", highlight = "Black" },
		},

		tab_selected = {
			fg = { attribute = "fg", highlight = "Normal" },
			bg = { attribute = "bg", highlight = "Normal" },
		},
		tab = {
			fg = { attribute = "fg", highlight = "Black" },
			bg = { attribute = "bg", highlight = "Black" },
		},
		tab_close = {
			fg = { attribute = "fg", highlight = "TabLineSel" },
			bg = { attribute = "bg", highlight = "Normal" },
		},

		duplicate_selected = {
			fg = { attribute = "fg", highlight = "TabLineSel" },
			bg = { attribute = "bg", highlight = "TabLineSel" },
			-- gui = "italic",
			italic = true,
		},
		duplicate_visible = {
			fg = { attribute = "fg", highlight = "Black" },
			bg = { attribute = "bg", highlight = "Black" },
			-- gui = "italic",
			italic = true,
		},
		duplicate = {
			fg = { attribute = "fg", highlight = "Black" },
			bg = { attribute = "bg", highlight = "Black" },
			-- gui = "italic",
			italic = true,
		},

		modified = {
			fg = { attribute = "fg", highlight = "Black" },
			bg = { attribute = "bg", highlight = "Black" },
		},
		modified_selected = {
			fg = { attribute = "fg", highlight = "Normal" },
			bg = { attribute = "bg", highlight = "Normal" },
		},
		modified_visible = {
			fg = { attribute = "fg", highlight = "Black" },
			bg = { attribute = "bg", highlight = "Black" },
		},

		separator = {
			fg = { attribute = "bg", highlight = "Black" },
			bg = { attribute = "bg", highlight = "Black" },
		},
		separator_selected = {
			fg = { attribute = "bg", highlight = "Normal" },
			bg = { attribute = "bg", highlight = "Normal" },
		},
		indicator_selected = {
			fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
			bg = { attribute = "bg", highlight = "Normal" },
		},
	},
})
