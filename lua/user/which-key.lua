local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	return
end

-- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
whichkey.setup({
})
