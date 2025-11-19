local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
    return
end

onedark.setup({
    style = "darker",
    ending_tildes = true,
    -- transparent=true,
    toggle_style_key = nil,
    code_style = {--italic, bold, underline, none
        comments = "italic",
        keywords = "italic",
        functions = "none",
        strings = "none",
        variables = "none",
    },
    lualine = {
        transparent = false,
    },
    -- Custom Highlights --
    colors = {
        bg0 = "#000000",
        grey = "#5c6370",
        bg1 = "#111111",
        bg2 = "#222222",
        bg3 = "#232323",
        fg = "#93a1a1",
        black = "#000000",
        blue = "#82AAFF", -- #01a0e4
    },              -- Override default colors
    highlights = {
        ["@operator"] = { fg = "$purple" },
        ["@punctuation.bracket"] = { fg = "$yellow" },
        ["@include"] = { fg = "$yellow" },
        ["@function"] = { fg = "#82AAFF" },
        ["@method"] = { fg = "#82AAFF" },
        ["@variable"] = { fg = "#ffffcf" },
        ["@variable.builtin"] = { fg = "#ffffcf" },
    }, -- Override highlight groups
})

vim.cmd([[
    syntax on
    filetype on
    filetype plugin indent on
]])

onedark.load()
