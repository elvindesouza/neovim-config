local status_ok, possession = pcall(require, "possession")
if not status_ok then
	return
end

local new_commands = {
	save = "Ssave",
	load = "Sload",
	delete = "Sdel",
	list = "Slist",
}

possession.setup({ commands = new_commands })

--[[ local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
	return
end ]]

--telescope.load_extension("possession")
