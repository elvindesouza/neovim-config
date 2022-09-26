local status_ok_navic, tz = pcall(require, "true-zen")
if not status_ok_navic then
	return
end

tz.setup({
	integrations = {
		tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
	},
})
