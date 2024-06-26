local status_ok, nvim_surround = pcall(require, "nvim-surround")
if not status_ok then
	return
end

nvim_surround.setup({
	-- Configuration here, or leave empty to use defaults
	keymaps = { -- vim-surround style keymaps
		insert = "<C-g>s",
		insert_line = "<C-g>S",
		normal = "s",
		normal_cur = "ss",
        -- normal_line = "S",
        -- normal_cur_line = "SS",
		visual = "S",
		visual_line = "gS",
		delete = "ds",
		change = "cs",
	},
})
