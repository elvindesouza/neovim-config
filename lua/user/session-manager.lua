local status_ok, possession = pcall(require, "possession")
if not status_ok then
	return
end

local new_commands = {
	--	save = "Ssave",
	--	load = "Sload",
	--	delete = "Sdel",
	--	list = "Slist",
}

possession.setup({
	commands = new_commands,

	autosave = {
		current = true, -- or fun(name): boolean
		tmp = true, -- or fun(): boolean
		tmp_name = "tmp",
		on_load = true,
		on_quit = true,
	},
})

--[[ local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
	return
end ]]

--telescope.load_extension("possession")
