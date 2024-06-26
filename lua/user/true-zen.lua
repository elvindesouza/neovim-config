local status_ok_true_zen, tz = pcall(require, "true-zen")
if not status_ok_true_zen then
	return
end

tz.setup({
	minimalist = {
		ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
		options = { -- options to be disabled when entering Minimalist mode
			number = false,
			relativenumber = false,
			showtabline = 0,
			signcolumn = "no",
			statusline = "",
			cmdheight = 0,
			laststatus = 0,
			showcmd = false,
			showmode = false,
			ruler = false,
			numberwidth = 1,
		},
		callbacks = { -- run functions when opening/closing Minimalist mode
			open_pre = nil,
			open_pos = nil,
			close_pre = nil,
			close_pos = nil,
		},
	},
	integrations = {
		tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
	},
})
