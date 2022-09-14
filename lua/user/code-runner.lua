local status_ok, crunner = pcall(require, "code_runner")
if not status_ok then
	return
end

crunner.setup({
	-- put here the commands by filetype
	filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python3 -u",
		typescript = "deno run",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
		sh = "cd $dir && sh $fileName",
	},
})
