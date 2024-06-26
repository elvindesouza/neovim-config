local status_ok, be = pcall(require, "better_escape")
if not status_ok then
	return
end

be.setup({})
