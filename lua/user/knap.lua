local keymap = vim.keymap.set

keymap("i", "<F7>", function()
	require("knap").toggle_autopreviewing()
end)
keymap("v", "<F7>", function()
	require("knap").toggle_autopreviewing()
end)
keymap("n", "<F7>", function()
	require("knap").toggle_autopreviewing()
end)
